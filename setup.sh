#!/bin/bash

# AIDLC Agent Setup Script
# Sets up dev-agent with dynamic path resolution

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 AIDLC Agent Setup${NC}"
echo "Setting up dev-agent with AIDLC optimization..."

# Get absolute path of current directory
REPO_PATH=$(pwd)
echo -e "${YELLOW}Repository path: ${REPO_PATH}${NC}"

# Check if template exists
TEMPLATE_PATH="${REPO_PATH}/templates/dev-agent.json.template"
if [ ! -f "$TEMPLATE_PATH" ]; then
    echo -e "${RED}❌ Template not found: $TEMPLATE_PATH${NC}"
    exit 1
fi

# Create Amazon Q CLI agents directory
AGENTS_DIR="$HOME/.aws/amazonq/cli-agents"
mkdir -p "$AGENTS_DIR"

# Show existing agents
echo
echo -e "${BLUE}📋 Existing Agents:${NC}"
if [ -d "$AGENTS_DIR" ] && [ "$(ls -A "$AGENTS_DIR"/*.json 2>/dev/null)" ]; then
    ls -1 "$AGENTS_DIR"/*.json 2>/dev/null | while read -r agent_file; do
        agent_name=$(basename "$agent_file" .json)
        echo "  • ${agent_name}"
    done
else
    echo "  (No existing agents)"
fi

# Agent name selection
echo
echo -e "${BLUE}🤖 Agent Name Setup${NC}"
echo -e "${YELLOW}Enter agent name (default: dev-agent):${NC}"
read -r agent_name
if [ -z "$agent_name" ]; then
    agent_name="dev-agent"
fi

# Generate agent path
AGENT_PATH="${AGENTS_DIR}/${agent_name}.json"

# Check if agent already exists
if [ -f "$AGENT_PATH" ]; then
    echo -e "${YELLOW}⚠️  Agent '${agent_name}' already exists. Overwrite? (y/N):${NC}"
    read -r overwrite_agent
    if [[ ! "$overwrite_agent" =~ ^[Yy]$ ]]; then
        echo -e "${RED}❌ Setup cancelled${NC}"
        exit 1
    fi
fi

echo -e "${YELLOW}Generating agent configuration...${NC}"

# MCP Server Selection
echo
echo -e "${BLUE}🔌 MCP Server Setup${NC}"
echo -e "${YELLOW}Do you want to add recommended MCP servers? (Y/n):${NC}"
read -r setup_mcp
if [[ ! "$setup_mcp" =~ ^[Nn]$ ]]; then
    MCP_CONFIG_FILE="${REPO_PATH}/mcp_servers.json"
    if [ -f "$MCP_CONFIG_FILE" ]; then
        echo -e "${GREEN}Available MCP servers:${NC}"
        echo
        
        # Parse and display MCP options
        mcp_keys=$(jq -r '.recommended | keys[]' "$MCP_CONFIG_FILE")
        declare -a selected_mcps
        
        for key in $mcp_keys; do
            name=$(jq -r ".recommended.\"$key\".name" "$MCP_CONFIG_FILE")
            desc=$(jq -r ".recommended.\"$key\".description" "$MCP_CONFIG_FILE")
            
            echo -e "${BLUE}[$key]${NC} ${desc}"
            echo -e "${YELLOW}  Add this MCP server? (y/N):${NC}"
            read -r add_mcp
            if [[ "$add_mcp" =~ ^[Yy]$ ]]; then
                selected_mcps+=("$key")
                
                # Check for setup notes
                setup_note=$(jq -r ".recommended.\"$key\".setup_note // empty" "$MCP_CONFIG_FILE")
                if [ -n "$setup_note" ]; then
                    echo -e "${YELLOW}  ⚠️  ${setup_note}${NC}"
                fi
            fi
            echo
        done
        
        # Build MCP servers JSON
        if [ ${#selected_mcps[@]} -gt 0 ]; then
            MCP_JSON="{"
            first=true
            for key in "${selected_mcps[@]}"; do
                if [ "$first" = false ]; then
                    MCP_JSON="${MCP_JSON},"
                fi
                first=false
                
                name=$(jq -r ".recommended.\"$key\".name" "$MCP_CONFIG_FILE")
                config=$(jq -c ".recommended.\"$key\".config" "$MCP_CONFIG_FILE")
                MCP_JSON="${MCP_JSON}\"${name}\":${config}"
            done
            MCP_JSON="${MCP_JSON}}"
            echo -e "${GREEN}✅ Selected ${#selected_mcps[@]} MCP server(s)${NC}"
        else
            MCP_JSON="{}"
            echo -e "${YELLOW}No MCP servers selected${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  MCP configuration file not found: ${MCP_CONFIG_FILE}${NC}"
        MCP_JSON="{}"
    fi
else
    echo -e "${YELLOW}⏭️  Skipping MCP server setup${NC}"
    MCP_JSON="{}"
fi

# Replace {{REPO_PATH}} and {{MCP_SERVERS}} and {{AGENT_NAME}} with actual values
sed -e "s|{{REPO_PATH}}|${REPO_PATH}|g" \
    -e "s|{{AGENT_NAME}}|${agent_name}|g" \
    -e "s|\"mcpServers\": {}|\"mcpServers\": ${MCP_JSON}|g" \
    "$TEMPLATE_PATH" > "$AGENT_PATH"

# Verify generated file
if [ ! -f "$AGENT_PATH" ]; then
    echo -e "${RED}❌ Failed to generate agent configuration${NC}"
    exit 1
fi

# Verify contexts directory exists
if [ ! -d "${REPO_PATH}/contexts" ]; then
    echo -e "${RED}❌ Contexts directory not found: ${REPO_PATH}/contexts${NC}"
    exit 1
fi

# Language selection and user_preference.md generation
echo
echo -e "${BLUE}🌐 Language Selection${NC}"
echo -e "${YELLOW}Select your preferred language:${NC}"
echo "1) 日本語 (Japanese)"
echo "2) English"
echo "3) 中文 (Chinese)"
echo "4) Español (Spanish)"
echo "5) Français (French)"

read -p "Enter your choice (1-5, default: 1): " lang_choice

case "${lang_choice:-1}" in
    1)
        LANG_NAME="日本語"
        LANG_INSTRUCTION="エージェントは**必ず**日本語でレスポンスを行うこと。"
        ;;
    2)
        LANG_NAME="English"
        LANG_INSTRUCTION="Agent **MUST** always respond in English."
        ;;
    3)
        LANG_NAME="中文"
        LANG_INSTRUCTION="代理**必须**始终用中文回应。"
        ;;
    4)
        LANG_NAME="Español"
        LANG_INSTRUCTION="El agente debe responder siempre en español."
        ;;
    5)
        LANG_NAME="Français"
        LANG_INSTRUCTION="L'agent doit toujours répondre en français."
        ;;
    *)
        LANG_NAME="日本語"
        LANG_INSTRUCTION="エージェントは**必ず**日本語でレスポンスを行うこと。"
        ;;
esac

echo -e "${GREEN}Selected language: ${LANG_NAME}${NC}"

# User name setup
DEFAULT_USER=$(whoami)
echo -e "${BLUE}Enter user name for SPEC management (default: ${DEFAULT_USER}):${NC}"
read -r user_name
if [ -z "$user_name" ]; then
    user_name="$DEFAULT_USER"
fi
echo -e "${GREEN}User name set to: ${user_name}${NC}"

# Generate user_preference.md
USER_PREF_PATH="${REPO_PATH}/contexts/user_preference_${agent_name}.md"

# Check if user_preference.md already exists
if [ -f "$USER_PREF_PATH" ]; then
    echo -e "${YELLOW}⚠️  user_preference_${agent_name}.md already exists${NC}"
    echo -e "${BLUE}Do you want to overwrite it? (y/N):${NC}"
    read -r overwrite_pref
    if [[ ! "$overwrite_pref" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}⏭️  Keeping existing user_preference_${agent_name}.md${NC}"
    else
        cat > "$USER_PREF_PATH" << EOF
<!-- AIDLCを改善する場合は必ずこのファイルにルールを追加する。他のコンテキストには変更を加えない。 -->
- ${LANG_INSTRUCTION}
- User name is "${user_name}". **Use this name for SPEC management**.
EOF
        echo -e "${GREEN}✅ Generated user_preference_${agent_name}.md with ${LANG_NAME} preference and user name${NC}"
    fi
else
    cat > "$USER_PREF_PATH" << EOF
<!-- AIDLCを改善する場合は必ずこのファイルにルールを追加する。他のコンテキストには変更を加えない。 -->
- ${LANG_INSTRUCTION}
- User name is "${user_name}". **Use this name for SPEC management**.
EOF
    echo -e "${GREEN}✅ Generated user_preference_${agent_name}.md with ${LANG_NAME} preference and user name${NC}"
fi

# Count available contexts
CONTEXT_COUNT=$(find "${REPO_PATH}/contexts" -name "*.md" | wc -l)

echo -e "${GREEN}✅ Agent configuration created successfully!${NC}"

# Shell alias setup
echo
echo -e "${BLUE}🔧 Shell Alias Setup${NC}"

# Ask if user wants to set up alias
echo -e "${BLUE}Do you want to set up a shell alias for 'q chat --agent ${agent_name}'? (Y/n):${NC}"
read -r setup_alias
if [[ "$setup_alias" =~ ^[Nn]$ ]]; then
    echo -e "${YELLOW}⏭️  Skipping alias setup${NC}"
else
    # Detect current shell
    CURRENT_SHELL=$(basename "$SHELL")
    echo -e "${YELLOW}Detected shell: ${CURRENT_SHELL}${NC}"

    # Determine shell config file
    case "$CURRENT_SHELL" in
        "zsh")
            SHELL_CONFIG="$HOME/.zshrc"
            ;;
        "bash")
            if [ -f "$HOME/.bashrc" ]; then
                SHELL_CONFIG="$HOME/.bashrc"
            else
                SHELL_CONFIG="$HOME/.bash_profile"
            fi
            ;;
        "fish")
            SHELL_CONFIG="$HOME/.config/fish/config.fish"
            ;;
        *)
            echo -e "${YELLOW}⚠️  Unknown shell: ${CURRENT_SHELL}${NC}"
            SHELL_CONFIG=""
            ;;
    esac

    # Add alias if shell config found
    if [ -n "$SHELL_CONFIG" ]; then
        echo -e "${BLUE}Enter alias name for 'q chat --agent ${agent_name}' (default: qcd):${NC}"
        read -r alias_name
        if [ -z "$alias_name" ]; then
            alias_name="qcd"
        fi
        
        ALIAS_LINE="alias ${alias_name}='q chat --agent ${agent_name}'"
        
        # Check if alias already exists
        if [ -f "$SHELL_CONFIG" ] && grep -q "alias ${alias_name}=" "$SHELL_CONFIG"; then
            echo -e "${YELLOW}⚠️  Alias '${alias_name}' already exists in ${SHELL_CONFIG}${NC}"
            echo -e "${BLUE}Do you want to update it? (y/N):${NC}"
            read -r response
            if [[ "$response" =~ ^[Yy]$ ]]; then
                # Remove existing alias and add new one
                grep -v "alias ${alias_name}=" "$SHELL_CONFIG" > "${SHELL_CONFIG}.tmp" && mv "${SHELL_CONFIG}.tmp" "$SHELL_CONFIG"
                echo "$ALIAS_LINE" >> "$SHELL_CONFIG"
                echo -e "${GREEN}✅ Alias '${alias_name}' updated in ${SHELL_CONFIG}${NC}"
            else
                echo -e "${YELLOW}⏭️  Skipping alias update${NC}"
            fi
        else
            echo -e "${BLUE}Add alias '${alias_name}' to ${SHELL_CONFIG}? (Y/n):${NC}"
            read -r response
            if [[ ! "$response" =~ ^[Nn]$ ]]; then
                echo "$ALIAS_LINE" >> "$SHELL_CONFIG"
                echo -e "${GREEN}✅ Alias '${alias_name}' added to ${SHELL_CONFIG}${NC}"
                echo -e "${YELLOW}💡 Run 'source ${SHELL_CONFIG}' or restart your terminal to use the alias${NC}"
            else
                echo -e "${YELLOW}⏭️  Skipping alias setup${NC}"
            fi
        fi
    else
        echo -e "${YELLOW}⚠️  Could not determine shell config file${NC}"
        echo -e "${BLUE}💡 Manually add this alias to your shell config:${NC}"
        echo -e "${GREEN}alias your_alias='q chat --agent ${agent_name}'${NC}"
    fi
fi

echo
echo -e "${GREEN}✅ Setup completed successfully!${NC}"
echo
echo -e "${BLUE}📋 Summary:${NC}"
echo "  • Agent: ${agent_name}"
echo "  • Configuration: ${AGENT_PATH}"
echo "  • Repository: ${REPO_PATH}"
echo "  • Contexts loaded: ${CONTEXT_COUNT} files"
echo "  • Shell: ${CURRENT_SHELL}"
if [ -n "$SHELL_CONFIG" ]; then
    echo "  • Config file: ${SHELL_CONFIG}"
fi
echo
echo -e "${GREEN}🎯 Usage:${NC}"
echo "  q chat --agent ${agent_name}"
if [ -n "$SHELL_CONFIG" ] && [ -n "$alias_name" ]; then
    echo "  ${alias_name}  (after sourcing shell config)"
fi
echo
echo -e "${YELLOW}💡 Available AIDLC features:${NC}"
echo "  • SPEC-driven development workflow"
echo "  • Q-SPEC Framework for requirements gathering"
echo "  • Automatic DRY compliance checking"
echo "  • Quality gates and cleanup automation"
echo "  • Git workflow optimization"
echo
echo -e "${BLUE}Happy coding with AIDLC! 🎉${NC}"

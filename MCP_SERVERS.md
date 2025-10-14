# MCP Servers Configuration

This file documents the recommended MCP (Model Context Protocol) servers for AIDLC agents.

## Configuration File

`mcp_servers.json` contains the recommended MCP server configurations that can be selected during agent setup.

## Recommended MCP Servers

### AWS Services Integration

- **aws-documentation**: AWS official documentation search
  - Provides access to AWS service documentation
  - No additional setup required

- **aws-pricing**: AWS pricing information
  - Query AWS service pricing
  - No additional setup required

- **aws-diagram**: AWS architecture diagram generation
  - Generate AWS architecture diagrams
  - No additional setup required


## Adding Custom MCP Servers

### Method 1: Add to mcp_servers.json

Edit `mcp_servers.json` and add your MCP server under the `recommended` section:

```json
{
  "recommended": {
    "your-mcp-name": {
      "name": "your-mcp-server",
      "description": "Description of your MCP server",
      "config": {
        "command": "command-to-run",
        "args": ["arg1", "arg2"],
        "env": {
          "ENV_VAR": "value"
        },
        "timeout": 30000
      },
      "setup_note": "Optional setup instructions"
    }
  }
}
```

### Method 2: Manual Configuration

After running `setup.sh`, manually edit the generated agent JSON file:

```bash
# Edit your agent configuration
vim ~/.aws/amazonq/cli-agents/your-agent-name.json
```

Add your MCP server to the `mcpServers` section:

```json
{
  "mcpServers": {
    "your-mcp-server": {
      "command": "command-to-run",
      "args": ["arg1", "arg2"],
      "env": {
        "ENV_VAR": "value"
      },
      "timeout": 30000
    }
  }
}
```

## Environment Variables

Some MCP servers require environment variables. You can set them:

1. **In the agent configuration** (recommended for agent-specific values)
2. **In your shell profile** (for global values)
3. **Using a .env file** (if supported by the MCP server)

## Testing MCP Servers

After setup, test your MCP server:

```bash
q chat --agent your-agent-name
# Ask the agent to use the MCP server functionality
```

## Troubleshooting

### MCP Server Not Responding

- Check timeout settings (increase if needed)
- Verify command and args are correct
- Check environment variables are set

### Permission Issues

- Ensure MCP server executable has proper permissions
- For Python servers: verify virtual environment path
- For Node servers: ensure npx/node is in PATH

## Resources

- [MCP Official Documentation](https://modelcontextprotocol.io/)
- [AWS MCP Servers](https://github.com/awslabs/mcp-servers)
- [Official MCP Servers](https://github.com/modelcontextprotocol/servers)

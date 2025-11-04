# Tech

## Technology Stack

### 前提環境

**Q dev CLI（Amazon Q Developer CLI）**
- Q-SPEC Kitの実行基盤
- エージェントとの対話インターフェース
- セッション継続性によるコンテキスト保持

**Git**
- バージョン管理
- SPEC-aligned commits
- コンテキスト保存

**標準シェルコマンド**
- find, grep等の基本的なファイル操作
- クロスプラットフォーム対応

---

## Platform Support

**対応OS**:
- macOS
- Linux
- Windows

クロスプラットフォームでの動作を前提とする。

---

## Dependencies

### 必須依存
- Q dev CLI
- Git
- 標準シェルコマンド（find, grep, cp, mv等）

### 外部依存なし
Q-SPEC Kit自体は、コンテキストファイル（Markdownファイル群）とセットアップスクリプトで構成される。
追加の外部ツールやライブラリは不要。

---

## User Requirements

**必要スキル**:
- ターミナルCLI操作
- Git基本操作
- 仕様策定への関与能力

---

**Created**: 2025-11-04

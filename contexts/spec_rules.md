# SPECとは
SPECとはAIエージェントが作業を行う際に守るべき仕様である。

## コア原則
- **ALL YOU NEED is SPEC**: 「機能開発」をはじめとして「バグ修正」「調査」「ドキュメンテーション」など、あらゆる作業にSPECを適用する。コーディングエージェントはSPECを利用することで、飛躍的にタスク遂行能力が向上する。
- **SPEC as an Asset**: SPECは再利用可能な資産である。`notes.md`や`reports.md`を活用することでその真価を発揮する。偶然の発見や問題解決過程を資産として保存することで、同じ問題に遭遇したときに`find`や`grep`によって過去のSPECを再利用することができる。
- **Question-base SPEC-driven Development**: SPEC-Q Frameworkを用いたユーザヒアリングにより、ユーザの負荷を抑えながら極めて品質の高いSPECを作成する。

# SPECの作成
## SPEC命名規則
SPECは以下の形式でディレクトリを作成する。
`.kiro/specs/YYYYMMDD-HHMM_spec-name/`
必ずSPEC作成時点の年月日時分を含める。
spec-nameはSPECの実態を表す詳細な名前をつけることで、検索性を高め、後々の再利用をしやすくする。

### spec-name例
✅ implement-user-authentication-system
✅ fix-api-rate-limiting
❌ auth (曖昧)
❌ bug-fix (非具体的)

## SPEC構成
各SPECディレクトリには以下のファイルを含む：
- requirements.md - 要求仕様
- design.md - 設計仕様  
- tasks.md - 実装タスク
- notes.md - 開発ログ（思考記録・発見記録・問題解決過程）

# SPECの実行
## 作成手順
1. SPEC-Q Frameworkでヒアリング
2. requirements.md作成
3. design.md作成
4. tasks.md作成（実装チェックリスト）
5. 実装開始（notes.mdに記録）

## 完了条件
- [ ] 全タスク完了
- [ ] テスト通過
- [ ] report.md作成
- [ ] もしくはユーザの指示

# SPECの状態管理
## アクティブSPEC
- 場所: `.kiro/specs/` 配下
- 状態: 作業進行中

## 完了SPEC
- 条件: `report.md` 作成完了
- 移動先: `.kiro/specs/closed/{SPECクローズ日:YYYYMMDD}_{ユーザ名}/{SPEC作成時点:YYYYMMDD-HHMM}_{spec-name}/`

移動先の年月日はクローズ日とする。

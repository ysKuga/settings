# settings

VSCode の拡張の指定などの実装を伴わないプロジェクトの設定について

## プロジェクトの構造について

### プロジェクト内部設定

以下については当プロジェクト向けの設定となる。

- `.husky/`
  - コミットの補正などに使用
- `scripts/`
  - husky で使用するスクリプトなどを格納
- プロジェクトルートの各ファイル
  - `package.json` など使用するパッケージ指定など
  - `.editorconfig` についてはプロジェクト設定としての用途もある。

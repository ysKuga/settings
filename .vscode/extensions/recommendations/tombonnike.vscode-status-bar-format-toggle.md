# Formatting Toggle

<https://marketplace.visualstudio.com/items?itemName=tombonnike.vscode-status-bar-format-toggle>

フォーマットをかけないファイルを保存する際に一時的にフォーマット処理を無効化するなど

## 設定

以下の設定を追加しておかないとオンオフの切り替え時に期待しない `formatOnType` の設定が追加されるなどする。

```json
  "formattingToggle.affects": ["editor.formatOnSave"]
```

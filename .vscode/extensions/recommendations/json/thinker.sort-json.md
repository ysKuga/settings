# Sort JSON

<https://marketplace.visualstudio.com/items?itemName=Thinker.sort-json>

JSON の記述を並べ替えるのに使用する。

- コマンドからの並べ替え
- 保存時の自動整形

## 設定

```json
  "editor.codeActionsOnSave": {
    "source.fixAll.sort-json": "explicit" // set to explicit true to sort json files on save. set to "never" or false to stop sorting on save
  },
```

# Sort JSON objects

<https://marketplace.visualstudio.com/items?itemName=richie5um2.vscode-sort-json>

JSON の保存時のフォーマッターとして使用可能

## 設定

```json
  "[json]": {
    "editor.codeActionsOnSave": {
      // sort-json は explicit などで有効にすると対象となる JSON をすべて並べ替えてしまうので注意
      "source.fixAll.sort-json": "never"
    },
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
```

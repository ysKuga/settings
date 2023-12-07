# Tailwind CSS IntelliSense

<https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss>

Tailwind CSS の IntelliSense を表示する。

## 設定

パターンに合う記述をインテリセンス表示対象に指定する。

```json
  "tailwindCSS.experimental.classRegex": [
    ["'([^']*)'", "classnames\\(([^)]*)\\)"]
  ],
```

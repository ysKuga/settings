# GraphQL: Inline Operation Execution

<https://marketplace.visualstudio.com/items?itemName=graphql.vscode-graphql-execution>

GraphQL での実装に使用

## 設定

<https://the-guild.dev/graphql/config/docs#examples>

`.graphqlrc` or `.graphqlrc.yml/yaml`

```yaml
schema: schema.graphql
extensions:
  endpoints:
    default:
      url: 'https://localhost:3000/graphql'
```

```yml
projects:
  app:
    schema: schema.graphql
    extensions:
      endpoints:
        default:
          url: 'https://localhost:3000/graphql'
```

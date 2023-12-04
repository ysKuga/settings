#!/usr/bin/env bash

# `<<<` 使用のため bash

# 実行ディレクトリとして想定するプロジェクトルート
ROOT_DIR=`pwd`
# .vscode ディレクトリ
VSCODE_DIR=.vscode

JQ=`command -v jq`

# jq コマンドのチェック (以下 URL はうまく動作しなかったかもしれない)
# https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script#answer-677212
if [ -z "$JQ" ];then
    echo "jq コマンドが必要です"
    exit
fi

jsonExtensions=`cat "${VSCODE_DIR}/extensions.json"`

# recommendations 配下を配列形式にして取得
recommendations=`\
  sh "${ROOT_DIR}/scripts/utils/list-filenames.sh" "${VSCODE_DIR}/extensions/recommendations" | \
  # 最終行を除いて , を付与
  sed -e '$ ! s/\(.\+\)$/"\1",/' | \
  # 最終行のみ " での囲いのみ
  sed -e '$ s/\(.\+\)$/"\1"/' | \
  # リストを 1 行に
  tr -d '\n'
`

# recommendations の値を更新
jq '.recommendations = '[$recommendations] <<<"$jsonExtensions" > "${VSCODE_DIR}/extensions.json"

# extensions.json の並べ替え
npx --yes json-sort-cli "${VSCODE_DIR}/extensions.json" --arrays

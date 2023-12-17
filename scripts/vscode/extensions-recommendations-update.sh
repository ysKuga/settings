#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/00-init.sh"

# recommendations にインストール済みの拡張を反映する
# - recommendations 配下
# - インストール済みの拡張 (1 行目の `Extensions installed ...` を除外)
for extension in $(
  grep \
    -vf \
    <(sh "${ROOT_DIR}/scripts/utils/list-filenames.sh" "${VSCODE_DIR}/extensions/recommendations" | tr '[A-Z]' '[a-z]' | sort) \
    <(code --list-extensions | tail -n +2 | tr '[A-Z]' '[a-z]' | sort)
); do
  md_file="${VSCODE_DIR}/extensions/recommendations/${extension}.md"
  echo "# " >>$md_file
  echo "" >>$md_file
  echo "<https://marketplace.visualstudio.com/items?itemName=${extension}>" >>$md_file
done

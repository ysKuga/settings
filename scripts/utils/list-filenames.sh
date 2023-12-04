#!/usr/bin/env sh

# 指定したディレクトリ配下のファイル名をリスト化する

# 対象ディレクトリ
TARGET=$1

# 指定がディレクトリでない場合
if [ ! -d "$TARGET" ];then
  echo "対象のディレクトリを指定してください"
  exit
fi

# ファイル名をリスト化するコマンド
# https://unix.stackexchange.com/questions/70614/how-to-output-only-file-names-with-spaces-in-ls-al
# - そのままだとディレクトリが含まれる
# find .vscode/extensions/recommendations/ -printf "%f\n"

# - ディレクトリを除外するため `-` で始まる行で絞り込み
# - フィールドの取得は cut より awk
# - sort による並べ替え
# - uniq で重複削除
# - sed で拡張子削除
ls $TARGET -RfAl | grep "^-" | awk '{print $9}' | sort | uniq | sed -e 's/\.[a-zA-Z_0-9]\+$//'

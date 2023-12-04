# wsl/server-client/

[WSL に対し別端末から SSH により接続](https://gist.github.com/ysKuga/4055f32b2b3fafbc1192d867da4d0f0c#wsl-%E3%81%AB%E5%AF%BE%E3%81%97%E5%88%A5%E7%AB%AF%E6%9C%AB%E3%81%8B%E3%82%89-ssh-%E3%81%AB%E3%82%88%E3%82%8A%E6%8E%A5%E7%B6%9A)

WSL を起動した端末に別端末から SSH 接続を行う際に使用するスクリプトなど

## server

WSL を動作させる Windows

### win

Windows 側

- `server/win/ssh-start.ps1`
  - Windows の任意の場所に設置して `管理者権限` にて実行する。
  - 基本的には WSL 側のユーザーとパスワード入力が必要

### wsl

WSL 側

- `server/wsl/ip_address_show_eth0.sh`
  - 設置した端末の IP を取得するスクリプト
  - `ssh-start.ps1` にて使用するので内部の記述の位置に設置を行う。

## client

`server` 上の WSL にアクセスを行う端末

- `client/.ssh/config`
  - 必要に応じて接続先の `server` の情報を記述するベース (一般的な SSH の config)

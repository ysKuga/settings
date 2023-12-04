# Windows が受けるポートを指定 (`Windows Defender ファイアウォール` で許可したもの)
$listenport=
# WSL が SSH を受け付けているポートを指定
$connectport=
# WSL 上の任意の位置に設置した `wsl/ip_address_show_eth0.sh` により取得される WSL の IP
$connectaddress=wsl sh ~/ip_address_show_eth0.sh

netsh.exe interface portproxy add v4tov4 listenport=$listenport connectport=$connectport connectaddress=$connectaddress

netsh.exe interface portproxy show v4tov4

wsl sudo service ssh restart
# wsl sudo service docker start

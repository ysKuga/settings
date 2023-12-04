#!/usr/bin/env sh

# 設置した端末にて `eth0` の IP を取得する
ip address show eth0 | grep "scope global" | perl -p -e s/\\s+inet\ \(\(\\d+\\.\){3}\\d+\).*/\$1/g

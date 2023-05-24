#!/bin/bash

# репозиторий Zabbix

sudo apt update
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo apt update

# Zabbix сервер, веб-интерфейс и агент
sudo apt install -y zabbix-proxy-sqlite3

# sqlite3
sudo apt install -y sqlite3

sudo sh -c "echo DBName=zabbix_proxy >> /etc/zabbix/zabbix_proxy.conf"

sudo systemctl restart zabbix-proxy
sudo systemctl enable zabbix-proxy

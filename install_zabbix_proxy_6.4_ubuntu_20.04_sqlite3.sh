#!/bin/bash

# репозиторий Zabbix

sudo apt update
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu20.04_all.deb
sudo apt update

# Zabbix сервер, веб-интерфейс и агент
sudo apt install -y zabbix-proxy-sqlite3

# sqlite3
sudo apt install -y sqlite3

sudo mkdir -p /var/lib/sqlite/
sudo chown -R zabbix:zabbix /var/lib/sqlite

sudo sh -c "echo DBName=/var/lib/sqlite/zabbix_proxy.db >> /etc/zabbix/zabbix_proxy.conf"
sudo sed -i 's/Server=127.0.0.1/Server=192.168.56.11/g' /etc/zabbix/zabbix_proxy.conf

sudo systemctl restart zabbix-proxy
sudo systemctl enable zabbix-proxy

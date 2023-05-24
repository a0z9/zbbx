#!/bin/bash

# репозиторий Zabbix

sudo apt update
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo apt update

# Zabbix сервер, веб-интерфейс и агент
sudo apt install -y zabbix-proxy-mysql zabbix-sql-scripts

# mysql server
sudo apt install -y mysql-server

cat zbx_db_proxy.sql | sudo mysql

# импорт начальной схемы Zabbix proxy
cat /usr/share/zabbix-sql-scripts/mysql/proxy.sql | mysql --default-character-set=utf8mb4 -uzabbix -ppassword zabbix_proxy

echo 'set global log_bin_trust_function_creators = 0;' | sudo mysql

sudo sh -c "echo DBPassword=password >> /etc/zabbix/zabbix_proxy.conf"

sudo systemctl restart zabbix-proxy
sudo systemctl enable zabbix-proxy

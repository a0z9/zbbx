#!/bin/bash

# репозиторий Zabbix

sudo apt update
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
sudo dpkg -i zabbix-release_5.0-1+focal_all.deb
sudo apt update

# Zabbix сервер, веб-интерфейс и агент
sudo apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent
sudo apt update

# mysql server
sudo apt install -y mysql-server

cat zbx5_db.sql | sudo mysql

# импорт начальной схемы Zabbix
# zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -ppassword zabbix
sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -ppassword zabbix


echo 'set global log_bin_trust_function_creators = 0;' | sudo mysql

sudo sh -c "echo DBPassword=password >> /etc/zabbix/zabbix_server.conf"
sudo sh -c "echo php_value date.timezone Europe/Moscow >> /etc/zabbix/apache.conf"


sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2

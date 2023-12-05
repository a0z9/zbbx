#!/bin/bash

# репозиторий Zabbix

sudo apt update
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu20.04_all.deb
sudo apt update

# Zabbix агент
sudo apt install -y  zabbix-agent

sudo systemctl restart  zabbix-agent
sudo systemctl enable   zabbix-agent



# Настройка входа по серт для ssh клента.
## Выполняем на zabbix сервере 

1. $ su -
1. \# service zabbix-server stop

1. \# mkdir -p /home/zabbix/.ssh
1. \# ls -la /home/zabbix/.ssh

1. \# usermod -m -d /home/zabbix zabbix
1. \# chown -R zabbix:zabbix /home/zabbix

1. \# sudo -u zabbix ssh-keygen -t rsa

1. \# sudo -u zabbix ssh-copy-id student@172.17.17.12 (172.17.17.12 - адрес клиента, где будет выполнятся команда)
1. \# sudo -u zabbix ssh student@172.17.17.12

1. Отредактируйте файл zabbix_server.conf --> SSHKeyLocation=/home/zabbix/.ssh

1. \# service zabbix-server start
1. \# ^D

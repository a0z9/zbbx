create database zabbix_proxy character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'password';
grant all privileges on zabbix_proxy.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;


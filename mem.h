#!/bin/bash
# test zabbix script get memory stat

cat /proc/meminfo | awk "/$1/ {print \$2}"




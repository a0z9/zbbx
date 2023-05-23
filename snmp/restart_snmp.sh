#!/bin/bash

sudo service snmpd restart
sudo service snmptt restart
sudo service snmptrapd restart
# hard restart - warn! reload conf except!
sudo service zabbix-server restart


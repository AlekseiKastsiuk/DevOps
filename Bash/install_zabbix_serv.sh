#!/bin/bash
#sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.4/rhel/8/x86_64/zabbix-release-5.4-1.el8.noarch.rpm
#sudo dnf clean all
#sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts #zabbix-agent mariadb-server
#sudo systemctl start mariadb

#sudo mysql -e 'create database zabbix character set utf8 collate utf8_bin;'
#sudo mysql -e 'create user zabbix@localhost identified by "P@ssword1";'
#sudo mysql -e 'grant all privileges on zabbix.* to zabbix@localhost;'


#sudo ausearch -c 'zabbix_server' --raw | audit2allow -M my-zabbixserver
#sudo semodule -X 300 -i my-zabbixserver.pp
#sudo ausearch -c 'zabbix_server' --raw | audit2allow -M my-zabbixserver
#sudo semodule -i my-zabbixserver.pp


#zcat /usr/share/doc/zabbix-sql-scripts/mysql/create.sql.gz | mysql -u zabbix -p zabbix

sed -i 's/# DBHost=localhost/DBHost=localhost/g' /etc/zabbix/zabbix_server.conf 
sed -i 's/# DBPassword=/DBPassword=P@ssword1/g' /etc/zabbix/zabbix_server.conf 


sudo systemctl restart zabbix-server httpd php-fpm mariadb


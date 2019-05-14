# Required CentOS/RHEL tools: yum install -y wget autoconf automake gcc svn
# Required Debian/Ubuntu tools: apt-get install -y wget autoconf automake gcc subversion make pkg-config
#cd ~
mkdir zabbix30
cd zabbix30
svn co svn://svn.zabbix.com/tags/3.0.1 .
./bootstrap.sh
./configure --enable-agent
mkdir src/modules/zabbix_module_docker
cd src/modules/zabbix_module_docker
wget https://raw.githubusercontent.com/monitoringartist/Zabbix-Docker-Monitoring/master/src/modules/zabbix_module_docker/zabbix_module_docker.c
wget https://raw.githubusercontent.com/monitoringartist/Zabbix-Docker-Monitoring/master/src/modules/zabbix_module_docker/Makefile
make


Dockerized zabbix server and agent installation with containers metrics monitoring.
Only x86_64 systems supported.


Enable cgroup memory limit (For Jessie):

cat /etc/default/grub | grep GRUB_CMDLINE_LINUX_DEFAULT

GRUB_CMDLINE_LINUX_DEFAULT="quiet cgroup_enable=memory swapaccount=1"

update-grub

reboot


Install docker-machine, docker-compose.

Complete docker-machine provision.

Copy files to docker-machine directory (one-time only) :

./dockit.sh --machine=dock4 init

Create/edit machines/yourmachine.yml.
See examples:

./machines/dock4.yml - server

./machines/dock5.yml - agent(mongodb)

./machines/dock7.yml - agent only

Server example.
Run for zabbix server dockerized installation on docker-machine dock4

./dockit.sh --base=zbx-server --machine=dock4 start-daemon

Agent only dockerized installation on docker-machine dock7:

./dockit.sh --machine=dock7 start-daemon

Agent(mongodb) only dockerized installation on docker-machine dock5:

./dockit.sh --machine=dock5 start-daemon

See script zbx_env/var/lib/zabbix/modules/mongodb.sh


# InfraScripts
Contains all type of scripts from lb deployment to curl calls


##Steps to clone a server from root
Make sure you have same OS version on both the servers.
For Ubuntu Cloning
rsync -arvIP --exclude 'root/site-backups' --exclude 'dev' --exclude 'sys' --exclude 'boot' --exclude 'proc' --exclude 'tmp' --exclude 'lib/modules' --exclude 'lib64/modules' --exclude 'mnt' --exclude 'etc/network' --exclude 'etc/networks' --exclude 'etc/fstab' --exclude 'etc/hosts' --exclude 'var/lib/mysql' --exclude 'root/.ssh' --exclude 'etc/ssh' * root@<ip>:/

For Centos Cloning
rsync -arvIP --bwlimit=10000 --exclude 'dev' --exclude 'sys' --exclude 'boot' --exclude 'proc' --exclude 'tmp' --exclude 'lib/modules' --exclude 'lib64/modules' --exclude 'mnt' --exclude 'etc/sysconfig/network-scripts' --exclude 'etc/sysconfig/network' --exclude 'etc/fstab' --exclude 'etc/hosts' --exclude 'var/lib/mysql' --exclude 'root/.ssh' --exclude 'etc/ssh' * root@<ip>:/

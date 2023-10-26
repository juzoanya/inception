#!/bin/bash

service vsftpd start

adduser ${FTP_USER} --disabled-password
echo "${FTP_USER}:${FTP_USER_PWD}" | /usr/sbin/chpasswd
chown -R ${FTP_USER}:${FTP_USER} /var/www/html/inception

echo "${FTP_USER}" | tee -a /etc/vsftpd.userlist

sed -i -r "s/listen=NO/listen=YES/1"   /etc/vsftpd.conf
sed -i -r "s/listen_ipv6=YES/#listen_ipv6=YES/1"   /etc/vsftpd.conf
sed -i -r "s/connect_from_port_20=YES/connect_from_port_20=NO/1"   /etc/vsftpd.conf
sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf
sed -i -r "s/ssl_enable=NO/ssl_enable=YES/1"   /etc/vsftpd.conf


echo "
listen_port=21
listen_address=0.0.0.0
seccomp_sandbox=NO

pasv_enable=YES
pasv_min_port=21100
pasv_max_port=21110

allow_writeable_chroot=YES
user_sub_token=$USER
local_root=/var/www/html/inception
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" | tee -a /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf
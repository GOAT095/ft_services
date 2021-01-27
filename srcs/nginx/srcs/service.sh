sudo adduser anassif
#add user to sudoers
echo "%anassif ALL=(ALL) ALL" >>/etc/sudoers
echo anassif:anassif | chpasswd
#to prevent ssh from starting right away
rc-status
/etc/init.d/sshd start
nginx &
/telegraf-1.17.0/usr/bin/telegraf --config /etc/telegraf/telegraf.conf
#!/bin/bash

 

. function.sh


TMP1=`SCRIPTNAME`.log

> $TMP1   

BAR

CODE [U-68] 로그온 시 경고 메시지 제공

cat << EOF >> $result

[양호]: 서버 및 Telnet 서비스에 로그온 메시지가 설정되어 있는 경우

[취약]: 서버 및 Telnet 서비스에 로그온 메시지가 설정되어 있지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 

sudo cp /etc/motd.bak /etc/motd
sudo cp /etc/issue.net.bak /etc/issue.net
sudo cp /etc/vsftpd/vsftpd.conf.bak /etc/vsftpd/vsftpd.conf
sudo cp /etc/mail/sendmail.cf.bak /etc/mail/sendmail.cf
sudo cp /etc/named.conf.bak /etc/named.conf


cat $result

echo ; echo

 

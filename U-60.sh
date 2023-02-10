#!/bin/bash

 

. function.sh

  
 

BAR

CODE [U-60] ssh 원격접속 허용

cat << EOF >> $result

[양호]: 원격 접속 시 SSH 프로토콜을 사용하는 경우

[취약]: 원격 접속 시 Telnet, FTP 등 안전하지 않은 프로토콜을 사용하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1  

# Restore Telnet configuration, if backed up
if [ -d /etc/telnet.bak ]; then
    sudo rm -rf /etc/telnet
    sudo mv /etc/telnet.bak /etc/telnet
    sudo apt-get install telnet -y
fi

# Restore FTP configuration, if backed up
if [ -d /etc/ftp.bak ]; then
    sudo rm -rf /etc/ftp
    sudo mv /etc/ftp.bak /etc/ftp
    sudo apt-get install ftp -y
fi

# Stop ssh service
sudo service ssh stop

# Restore ssh configuration
sudo rm -rf /etc/ssh
sudo mv /etc/ssh.bak /etc/ssh
sudo apt-get install openssh-server -y

cat $result

echo ; echo 

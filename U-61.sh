#!/bin/bash

 

. function.sh

 

BAR

CODE [U-61] ftp 서비스 확인

cat << EOF >> $result

[양호]: FTP 서비스가 비활성화 되어 있는 경우

[취약]: FTP 서비스가 활성화 되어 있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1   

INFO "이 부분은 백업 파일 관련한 항목이 아닙니다"

#---------------------------------------------------
# Start the vsftpd service
sudo service vsftpd start

# Enable vsftpd service startup on boot
sudo /etc/rc.d/init.d/vsftpd start

# Start the proftp service
sudo service proftp start

# Enable proftp service startup on boot
sudo /etc/rc.d/init.d/proftp start

cat $result

echo ; echo 

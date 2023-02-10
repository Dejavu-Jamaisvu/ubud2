#!/bin/bash

. function.sh

BAR

CODE [U-18] 접속 IP 및 포트 제한

cat << EOF >> $result

[양호]: 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정한 경우

[취약]: 접속을 허용할 특정 호스트에 대한 IP 주소 및 포트 제한을 설정하지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore backup files
mv /etc/hosts.allow.bak /etc/hosts.allow
mv /etc/hosts.deny.bak /etc/hosts.deny

# Confirm the restore
echo "The backup files have been restored."

cat $result

echo ; echo
#!/bin/bash

. function.sh

BAR

CODE [U-36] 웹서비스 웹 프로세스 권한 제한

cat << EOF >> $result

[양호]: Apache 데몬이 root 권한으로 구동되지 않는 경우

[취약]: Apache 데몬이 root 권한으로 구동되는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Restore backup files
cp /etc/apache2/apache2.conf.bak /etc/apache2/apache2.conf


cat $result

echo ; echo
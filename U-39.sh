#!/bin/bash

. function.sh

BAR

CODE [U-39] 웹서비스 링크 사용금지

cat << EOF >> $result

[양호]: 심볼릭 링크, aliases 사용을 제한한 경우

[취약]: 심볼릭 링크, aliases 사용을 제한하지 않은 경우 

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore backup files
cp /etc/apache2/apache2.conf.bak /etc/apache2/apache2.conf



cat $result

echo ; echo
#!/bin/bash

. function.sh

BAR

CODE [U-11] /etc/syslog.conf 파일 소유자 및 권한 설정		

cat << EOF >> $result

[양호]: /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)이고, 권한이 640 이
하인 경우

[취약]: /etc/syslog.conf 파일의 소유자가 root(또는 bin, sys)가 아니거나, 권한이 
640 이하가 아닌 경우

EOF

BAR

# Restore system-auth file
cp xinetd.conf.bak xinetd.conf


cat $result

echo ; echo

#!/bin/bash

. function.sh

BAR

CODE [U-13] SUID, SGID, Sticky bit 설정 및 권한 설정		

cat << EOF >> $result

[양호]: 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있지 않은 
경우

[취약]: 주요 실행파일의 권한에 SUID와 SGID에 대한 설정이 부여되어 있는 경우

EOF

BAR


# Restore system-auth file
cp /bin/ping.bak /bin/ping 
cp /usr/bin/passwd.bak /usr/bin/passwd 
cp /usr/bin/sudo.bak /usr/bin/sudo 





cat $result

echo ; echo

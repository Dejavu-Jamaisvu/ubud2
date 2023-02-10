#!/bin/bash

. function.sh

BAR

CODE [U-47] 패스워드 최대 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있는 경우

[취약]: 패스워드 최대 사용기간이 90일(12주) 이하로 설정되어 있지 않는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Get the most recent backup file
backup_file=$(ls -t /etc/login.defs_backup* | head -n 1)

# Restore the original file from the backup
sudo cp "$backup_file" /etc/login.defs

echo "Original file restored from $backup_file"


cat $result

echo ; echo
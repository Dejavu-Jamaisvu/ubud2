#!/bin/bash

 

. function.sh

TMP1=`SCRIPTNAME`.log

> $TMP1

 

BAR

CODE [U-48] 패스워드 최소 사용기간 설정

cat << EOF >> $result

[양호]: 패스워드 최소 사용기간이 1일(1주)로 설정되어 있는 경우

[취약]: 패스워드 최소 사용기간이 설정되어 있지 않는 경우

EOF

BAR

# Get the most recent backup file
backup_file=$(ls -t /etc/login.defs_backup* | head -n 1)

# Restore the original file from the backup
sudo cp "$backup_file" /etc/login.defs

echo "Original file restored from $backup_file"

cat $result

echo ; echo

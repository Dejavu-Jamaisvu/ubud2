#!/bin/bash

. function.sh

BAR

CODE [U-46] 패스워드 최소 길이 설정

cat << EOF >> $result

[양호]: 패스워드 최소 길이가 8자 이상으로 설정되어 있는 경우 

[취약]: 패스워드 최소 길이가 8자 미만으로 설정되어 있는 경우 

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
#!/bin/bash

. function.sh

BAR

CODE [U-44] root 이외의 UID가 ‘0’ 금지

cat << EOF >> $result

[양호]: root 계정과 동일한 UID를 갖는 계정이 존재하지 않는 경우

[취약]: root 계정과 동일한 UID를 갖는 계정이 존재하는 경우

EOF

BAR

# Save Current Date and Time
current_date_time=$(date +"%Y-%m-%d %T")

# Get the backup file name
backup_file_name=`ls /etc/passwd_* | tail -n 1`

# Check if the backup file exists
if [ -f "$backup_file_name" ]; then
  # Restore the /etc/passwd file from the backup
  sudo cp $backup_file_name /etc/passwd

  # Get the username of the account with the same UID as the root account
  username=$(awk -F: '$3==0{print $1}' /etc/passwd)

  if [ -n "$username" ]; then
    # Reset the UID of the account to 0
    sudo usermod -u 0 $username
  else
    OK "An account with the same UID as the root account cannot be found"
  fi
else
  OK "Backup file not found"
fi


cat $result

echo ; echo
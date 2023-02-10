#!/bin/bash

. function.sh

BAR

CODE [U-40] 웹서비스 파일 업로드 및 다운로드 제한

cat << EOF >> $result

[양호]: 파일 업로드 및 다운로드를 제한한 경우

[취약]: 파일 업로드 및 다운로드를 제한하지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Check if a backup file exists
if [ -f /etc/apache2/apache2.conf.bak ]; then
  # Restore the backup file
  sudo cp /etc/apache2/apache2.conf.bak /etc/apache2/apache2.conf
else
  echo "Backup file not found. Please create a backup before running this script."
  exit 1
fi

# Restart Apache to apply the changes
if ! sudo service apache2 restart; then
  echo "Apache could not be restarted. Please check the logs for more information."
  exit 1
fi

echo "Apache configuration restored successfully."







cat $result

echo ; echo
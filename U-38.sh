#!/bin/bash

. function.sh

BAR

CODE [U-38] 웹서비스 불필요한 파일 제거

cat << EOF >> $result

[양호]: 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되어 있는 경우

[취약]: 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되지 않은 경우 

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

HTTPD_ROOT="/etc/apache2/apache2.conf"
UNWANTED_ITEMS="manual samples docs"

for item in $UNWANTED_ITEMS
do
if [ ! -d "$HTTPD_ROOT/$item" ] && [ ! -f "$HTTPD_ROOT/$item" ]; then
    sudo cp -r "$HTTPD_ROOT/backup/$item" "$HTTPD_ROOT/$item"
    OK "$item 이 $HTTPD_ROOT 로 복원되었습니다."
else
    WARN "$item 이 $HTTPD_ROOT 로 복원 안 되었습니다."
fi
done
#########################################################################
HTTPD_ROOT="/etc/apache2/apache2.conf"
UNWANTED_ITEMS="manual samples docs"
BACKUP_DIR="/tmp/httpd_backup"

if [ `ps aux | grep apache2 | grep -v "grep" | wc -l` -eq 0 ]; then
  echo "Apache not executed."
else
  if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory $BACKUP_DIR"
    mkdir "$BACKUP_DIR"
  fi

  for item in $UNWANTED_ITEMS
  do
    if [ -d "$HTTPD_ROOT/$item" ] || [ -f "$HTTPD_ROOT/$item" ]; then
      echo "Backing up $item from $HTTPD_ROOT to $BACKUP_DIR"
      cp -r "$HTTPD_ROOT/$item" "$BACKUP_DIR/$item"
    else
      echo "$item not found in $HTTPD_ROOT"
    fi
  done
#---------------------------------------------------------------------


for item in $UNWANTED_ITEMS
do
    if [ -d "$BACKUP_DIR/$item" ] || [ -f "$BACKUP_DIR/$item" ]; then
    echo "Recovering $item from $BACKUP_DIR to $HTTPD_ROOT"
    cp -r "$BACKUP_DIR/$item" "$HTTPD_ROOT/$item"
    else
    echo "$item not found in $BACKUP_DIR"
    fi
done
fi
cat $result

echo ; echo
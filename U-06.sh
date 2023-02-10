#!/bin/bash

. function.sh

BAR

CODE [U-06] 파일 및 디렉터리 소유자 설정 @@su 말고 sudo su 해야 함 @@

cat << EOF >> $result

[양호]: 소유자가 존재하지 않는 파일 및 디렉터리가 존재하지 않는 경우

[취약]: 소유자가 존재하지 않는 파일 및 디렉터리가 존재하는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


backup_dir="./backup_nouser_nogroup"

# 백업 디렉터리가 있는지 확인
if [ -d "$backup_dir" ]; then
  # 백업된 파일을 original location로 복사
  for file in $(find "$backup_dir" -type f); do
    original_file="$(echo "$file" | sed "s|$backup_dir||")"
    cp -R "$file" "$original_file"
  done

  # 백업 디렉터리 제거
  rm -rf "$backup_dir"

  echo "Files have been recovered and backup directory has been deleted."
else
  echo "Backup directory not found. No recovery possible."
fi

cat $result

echo ; echo
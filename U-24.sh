#!/bin/bash

. function.sh

BAR

CODE [U-24] NFS 서비스 비활성화		

cat << EOF >> $result

[양호]: 불필요한 NFS 서비스 관련 데몬이 비활성화 되어 있는 경우

[취약]: 불필요한 NFS 서비스 관련 데몬이 활성화 되어 있는 경우

EOF

BAR



# Check if NFS service is installed
if ! command -v nfsd &> /dev/null; then
  echo "NFS service not installed. Aborting restore."
  exit 1
fi

# Restore shares in dfstab or exports
if [ -f "/etc/dfs/dfstab.bak" ]; then
  cp "/etc/dfs/dfstab.bak" "/etc/dfs/dfstab"
  echo "Shares restored in /etc/dfs/dfstab."
elif [ -f "/etc/exports.bak" ]; then
  cp "/etc/exports.bak" "/etc/exports"
  echo "Shares restored in /etc/exports."
else
  echo "Shares backup file not found."
fi

# Start NFS services
services=("nfsd" "statd" "mountd")

for service in "${services[@]}"; do
  service "$service" start
  if [ $? -eq 0 ]; then
    echo "$service started successfully."
  else
    echo "Failed to start $service."
  fi
done



cat $result

echo ; echo

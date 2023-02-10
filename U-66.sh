#!/bin/bash

 

. function.sh
   

BAR

CODE [U-66] SNMP 서비스 구동 점검

cat << EOF >> $result

[양호]: SNMP 서비스를 사용하지 않는 경우

[취약]: SNMP 서비스를 사용하는 경우

EOF

BAR


# Restore the snmpd configuration file
sudo cp /etc/snmp/snmpd.conf.bak /etc/snmp/snmpd.conf

# Start the snmpd service
sudo service snmpd start

cat $result

echo ; echo
 


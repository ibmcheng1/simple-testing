#!/bin/bash

HOSTS="pgasd166 pgasd167 pgasd257 pgasd258 lcdsd6309"
for host in $HOSTS
do
  echo "Testing dmgr process on $host"
  ssh wsadmin@$host "curl -k https://localhost:10001/ibm/console"
  # if the command hung, it implies the dmgr process is broken and the netstat will show CLOSE_WAIT on port 10001 and 10003
done

for host in $HOSTS
do
  echo "Run netstat on dmgr process on $host"
  ssh wsadmin@$host "netstat -anpe | grep 10001;netstat -anpe | grep 10003"
done


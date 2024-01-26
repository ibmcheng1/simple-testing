#!/bin/bash

host=$1
ssh wsadmin@$host "netstat -anpe | grep 10001;netstat -anpe | grep 10003"


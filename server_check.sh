#!/bin/bash
#Desc: This script will check the new installed server
#Date: April 2021
## CPU chech
CPU_N='nproc'
if [ ${CPU_N} -lt 2 ]
then
echo "CPU check failed"
else
echo "CPU check pass"
fi
## Memory check
MEM='free -m |grep Mem| awk '{print $2}''
if [ ${MEM} -lt 2000 ]
then
echo "Memory check failed"
else
echo "Memory check pass"
fi 
## Check file existence
if [ -f /etc/group ]
then
echo "file /etc/group exist"
else
echo "file /etc/group is missing"
fi 
##
if [ -f /etc/passwd ]
then 
echo "file /etc/passwd exist"
else
echo "file /etc/passwd is missing"
fi
##
if [ -f /etc/httpd ]
then
echo " file /etc/httpd exist"
else
echo "file /etc/httpd is missing"
fi
##
if [ -f /etc/kubernetes ]
then 
echo "file /etc/kubernetes exist"
else
echo "file /etc/kubernetes is missing"
fi
##Check user puppet
id puppet
RC=$?
if [ ${RC} -eq 0 ]
then
echo "user puppet check pass"
else
echo "user puppet check failed"
fi
## Kernel version
KernelVersion='uname -r |awk -F "." '{print $1}''
if [ KernelVersion ]-gt 3 ]
then 
echo "Kernel version check pass"
else 
echo "Kernel version check failed"
fi

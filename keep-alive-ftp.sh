#!/bin/bash

# Ubuntu closes FTP connections after a few idle minutes
# This script keeps all mounted FTP connections alive

while true 
do
	ls ~/.gvfs/FTP* &> /dev/null
	sleep 60
done

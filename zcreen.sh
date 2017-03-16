#!/bin/bash
#
#
#
# Tool to print on screen stats in short.
#
TRB=$(tput setaf 1 && tput bold)
TRB=$(tput setaf 2 && tput bold)

TOTALMEM=`grep MemTotal /proc/meminfo | awk '{$2=$2/(1024^2); split($2,a,".");  print a[1] " GB"}'`

OUTPUT=``


function main() {
echo
echo "$TOTALMEM"
echo "LINE2"
echo "LINE3"
echo
}

main

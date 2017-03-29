#!/bin/bash
#
#
#
# Tool to print on screen stats in short.
#
#set -xv

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

# Styling.
TRB=$(tput setaf 1 && tput bold)
TRB=$(tput setaf 2 && tput bold)

function help () {
  OUTPUT=``
}

function mem() {
#TOTALMEM=`grep MemTotal /proc/meminfo | awk '{$2=$2/(1024^2); split($2,a,".");  print a[1] " GB"}'`
#TOTALMEM=`grep MemTotal /proc/meminfo | awk '{$2=$2/1024; print $2}'`
#RESULT=`awk -v n1=$TOTALMEM -v n2=0.0 'BEGIN{if (n1>n2) printf "BIG"; else printf "small";}'`
MemTotal=`grep MemTotal /proc/meminfo | awk '{ print $2}'`
MemFree=`grep MemFree /proc/meminfo | awk '{ print $2}'`
MemAvailable=`grep MemAvailable /proc/meminfo | awk '{print $2}'`

MemPercentageUsed=

}

mem

printf "\n"
printf "Totoal Memory : $MemTotal  /  MemFree : $MemFree  /  MemAvailable : $MemAvailable\n"
#printf "Result : $RESULT\n"
#printf "LINE3\n"
printf "\n"

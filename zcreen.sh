#!/bin/bash
#
#
#
# Tool to print on screen stats in short.
#
# set -xv

BASEDIR=$(dirname "$0")
#echo "$BASEDIR"

# Config - TODO move to config file.

#Font Colors
FC_Red='tput setaf 1'
FC_Green='tput setaf 2'
#Font Style
FS_Bold='tput bold'



function help () {
  OUTPUT=``
}

function mem_function() {
  # TODO - change this part to use /proc/meminfo.
  threshold1=20
  MEMtotal=`free -bt | grep Total | awk '{ print $2}'`
  #MEMused=`free -bt | grep Total | awk '{ print $3}'`
  MEMfree=`free -bt | grep Total | awk '{ print $4}'`
  MEMperc=$(awk -v t1=$MEMfree -v t2=$MEMtotal 'BEGIN{ printf "%.0f", (t1/t2 * 100) }')
  MEMfreeH=`free -ht | grep Total | awk '{ print $4}'`
  MEMtotalH=`free -ht | grep Total | awk '{ print $2}'`


  if [ $MEMperc -ge $threshold1 ]; then
    FC=$FC_Green
  else
    FC=$FC_Red
  fi
}


# Load functions.
mem_function

HNAME=`hostname`
CUPTIME=`uptime -p`


# Print out on screen.
printf "\n"
echo -n "Hostname : "; $FS_Bold && $FC_Green; echo -n "$HNAME"; tput sgr0; echo -n "  Current uptime : "; $FS_Bold && $FC_Green; echo "$CUPTIME"; tput sgr0;
echo -n "Total Free Memory : "; $FS_Bold && $FC; echo -n "$MEMperc% ($MEMfreeH/$MEMtotalH)"; tput sgr0;
printf "\n"
printf "\n"

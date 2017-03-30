#!/bin/bash
#
#
#
# Tool to print on screen stats in short.
#
# set -xv

BASEDIR=$(dirname "$0")
#echo "$BASEDIR"


function help () {
  OUTPUT=``
}

function mem() {
  threshold1=20
  MEMtotal=`free -bt | grep Total | awk '{ print $2}'`
  #MEMused=`free -bt | grep Total | awk '{ print $3}'`
  MEMfree=`free -bt | grep Total | awk '{ print $4}'`
  MEMperc=$(awk -v t1=$MEMfree -v t2=$MEMtotal 'BEGIN{ printf "%.0f", (t1/t2 * 100) }')
  MEMfreeH=`free -ht | grep Total | awk '{ print $4}'`
  MEMtotalH=`free -ht | grep Total | awk '{ print $2}'`

  if [ $MEMperc -ge $threshold1 ]; then
    echo -n "Total Free Memory : "; tput bold && tput setaf 2; echo -n "$MEMperc% ($MEMfreeH/$MEMtotalH)"; tput sgr0
  else
    echo -n "Total Free Memory : "; tput bold && tput setaf 1; echo -n "$MEMperc% ($MEMfreeH/$MEMtotalH)"; tput sgr0
  fi
}

printf "\n"

mem

printf "\n"
printf "\n"

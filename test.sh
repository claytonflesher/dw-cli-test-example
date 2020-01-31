#!/bin/bash -e

while getopts s:i: option
do
case "${option}"
in
s) SCRIPTS=${OPTARG};;
i) INPUT=${OPTARG};;
esac
done

for FILE in $SCRIPTS/*
do
  SCRIPT=$(<$FILE)
  echo $FILE
  echo $SCRIPT
  dw -i payload $INPUT "$SCRIPT"
  if [ "$?" -ne 0 ] # Exit code is not 0
  then
    exit
  fi
done

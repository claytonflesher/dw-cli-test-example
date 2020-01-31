#!/bin/bash

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
  echo $SCRIPT
  dw -i payload $INPUT "$SCRIPT"
done || exit 1

#!/bin/bash -x

HEAD=0
TAIL=1

random=$((RANDOM%2))
if [ $random -eq $HEAD ]
then
   echo "Head"
else
   echo "Tail"
fi

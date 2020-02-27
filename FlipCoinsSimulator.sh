#!/bin/bash -x

HEAD=0
TAIL=1

# variables
declare -A dictionary
count=0
headPercentage=0
tailPercentage=0
random=$((RANDOM%2))

if [ $random -eq HEAD ]
then
   printf "Head"
else
	printf "Tail"
fi

# Find percentage of the singlet combination
for (( index=1; index<=10; index++ ))
do
	random1=$(( RANDOM%2 ))
	if [ $random1 -eq $HEAD ]
   then
   	dictionary[$index]=Head
		(( ++count ))
	else
   	dictionary[$index]=Tail
	fi

done
headPercentage=`echo "$count/10*100" | bc -l`
tailPercentag=`echo "$((10-$count))/10*100 " | bc -l`


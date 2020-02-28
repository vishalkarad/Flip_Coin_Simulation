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

declare -A dictionary
function combination(){
   for (( index=0; index<$1; index++ ))
   do
      merg=""
      for (( index1=0; index1<$2; index1++ ))
      do
         random=$((RANDOM%2))
         if [ $random -eq $HEAD ]
         then
            merg+=H
         else
            merg+=T
         fi
      done
      dictionary[$merg]=$(( ${dictionary[$merg]}+1 ))
   done
   echo "All Combination : ${dictionary[@]}"
   echo  "All keys : ${!dictionary[@]}"
}

function findPercentage()
{
   for keys in ${!dictionary[@]}
   {

      persentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100 " | bc`
      echo  "$keys =  $persentage"
   }
}
read -p  "How many time you flip coin" flipCoin
read -p "Combination Single press 1) double press 2)" choice

if [ $choice -eq 1 ]
then
   combination $flipCoin $choice
   findPercentage
else
   combination $flipCoin $choice
   findPercentage
   echo "$findPercentage"
fi


#!/bin/bash 

HEAD=0
TAIL=1

# variables
declare -A dictionary

random=$((RANDOM%2))

if [ $random -eq $HEAD ]
then
   printf "Head"
else
	printf "Tail"
fi

# Combinations of  coin
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
#find percentage
function findPercentage(){
   for keys in ${!dictionary[@]}
   {
      persentage=`echo "scale=2; $((${dictionary[$keys]}))/$flipCoin*100" | bc`
      echo  "$keys =  $persentage"
   }
}
read -p  "How many time you flip coin" flipCoin
read -p "Combination Single press 1) double press 2) Tripal press 3)" choice

# Check choice in  if else
if [ $choice -eq 1 ]
then
   combination $flipCoin $choice
   findPercentage
elif [ $choice -eq 2 ]
then
   combination $flipCoin $choice
   findPercentage
elif [ $choice  -eq 3 ]
then
   combination $flipCoin $choice
   findPercentage
else
   printf "Please Enter a Right Choice" 
fi
# sort in desending order
for key in ${!dictionary[@]}
do
	echo -n " $key ${dictionary[$key]}"
done | sort -k2 -rn 


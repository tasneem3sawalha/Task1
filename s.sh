#!/bin/bash
echo "Disk" >> disk
echo "*****" >> disk
df -h |awk '{print $3,$4}' >> disk
echo "The average of used " >> disk
SUM=0
SUM1=0
C1=$(df |wc -l)
#for((I=2;I<C1;))
#do
#TMP=$(df -h |awk '{print $3}' |awk -v m=$I 'NR==m {print $1}')
#TMP2=$(df -h |awk '{print $4}' |awk -v m=$I 'NR==m {print $1}')
#NUM=$(echo $TMP |tr -dc '0-9'+'.')
#NUM2=$(echo $TMP2 |tr -dc '0-9'+'.')
#SUM=$(echo $SUM+$NUM |bc -l )
#SUM1=$(echo $SUM1+$NUM2 |bc -l )


SUM=$(df |awk '{s+=$3} END {print s} ')
SUM1=$(df |awk '{s+=$4} END {print s} ')
I=$((I+1))
#done
C2=$((C1-1))
AVG=$(echo $SUM/$C2 |bc -l )
AVG2=$(echo $SUM1/$C2 |bc -l )
echo $AVG >> disk
echo "The average of free space" >> disk
echo $AVG2 >> disk
echo "**********************************************************************************" >> disk
echo "The average of free space" >> disk2
echo $AVG2 >> disk2
echo "**********************************************************************************" >> disk2


echo "Memory" >> mem
free -m |awk 'NR==1,NR==2 {print $2,$3 }' >> mem
echo "***********************************************************" >>mem
echo "Memory" >> mem2
free -m |awk 'NR==1,NR==2 {print $2,$3 }' >> mem2
echo "***********************************************************" >>mem2

echo "CPU" >> cpu
 mpstat -P ALL|awk 'NR==3,NR==4 {print $4,$13 }' >>cpu
echo "***********************************************************" >>cpu

echo "CPU" >> cpu2
 mpstat -P ALL|awk 'NR==3,NR==4 {print $4,$13 }' >>cpu2
echo "***********************************************************" >>cpu2




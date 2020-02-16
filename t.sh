#/bin/bash
C=$(wc -l mem |awk '{print $1}')
#echo $C
SUM=0
SUM1=0
SUM2=0
SUM3=0
for ((I=3;I<C;))
do
TMP=$( sed "${I}q;d" mem | awk '{print $1}' )
TMP2=$( sed "${I}q;d" mem | awk '{print $2}' )
TMP3=$(awk -v m=$I 'NR==m {print $1}' cpu )
TMP4=$(awk -v m=$I 'NR==m {print $2}' cpu )



SUM=$((SUM+TMP))
SUM1=$((SUM1+TMP2))
SUM2=$(echo $SUM2 +$TMP3 |bc -l )
SUM3=$(echo $SUM3 +$TMP4 |bc -l )

I=$((I+4))
done
VAR=$(awk -v m=$C   'BEGIN { print (m / 4) }')
AVG=$(echo $SUM/$VAR |bc -l )
AVG2=$(echo $SUM1/$VAR |bc -l )
AVG3=$(echo $SUM2/$VAR |bc -l )
AVG4=$(echo $SUM3/$VAR |bc -l )


echo "***********************************************************" >> /var/www/html/mem.html
echo "The avg for used in mem" >> /var/www/html/mem.html
echo $AVG >> /var/www/html/mem.html
 date >> /var/www/html/mem.html
uptime >>  /var/www/html/mem.html

echo "***********************************************************" >> /var/www/html/mem.html
echo "The avg for free in mem" >> /var/www/html/mem.html
echo $AVG2 >> /var/www/html/mem.html
 date >> /var/www/html/mem.html
uptime >>  /var/www/html/mem.html


echo "***********************************************************" >> /var/www/html/cpu.html

echo "The avg for used in cpu" >> /var/www/html/cpu.html
echo $AVG3 >> /var/www/html/cpu.html
 date >> /var/www/html/cpu.html
uptime >>  /var/www/html/cpu.html



echo "***********************************************************" >> /var/www/html/cpu.html
echo "The avg for free in cpu" >> /var/www/html/cpu.html
echo $AVG4 >> /var/www/html/cpu.html
 date >> /var/www/html/cpu.html
uptime >>  /var/www/html/cpu.html





C=$(wc -l disk |awk '{print $1}')
SUM=0

for ((I=12;I<C;))
do
TMP=$( sed "${I}q;d" disk | awk '{print $1}' )
SUM=$(echo $SUM +$TMP |bc -l )
I=$((I+15))
done
VAR=$(awk -v m=$C   'BEGIN { print (m / 15) }')
AVG=$(echo $SUM/$VAR |bc -l )

echo "***********************************************************" >> /var/www/html/disk.html

echo "The avg for used in disk" >> /var/www/html/disk.html
echo $AVG >> /var/www/html/disk.html
 date >> /var/www/html/disk.html
uptime >>  /var/www/html/disk.html



SUM=0

for ((I=14;I<C;))
do
TMP=$( sed "${I}q;d" disk | awk '{print $1}' )
SUM=$(echo $SUM +$TMP |bc -l )
I=$((I+15))
done
VAR=$(awk -v m=$C   'BEGIN { print (m / 15) }')
AVG=$(echo $SUM/$VAR |bc -l )
echo "***********************************************************" >> /var/www/html/disk.html
 echo "The avg for free in disk" >> /var/www/html/disk.html
echo $AVG >> /var/www/html/disk.html
 date >> /var/www/html/disk.html
uptime >>  /var/www/html/disk.html


cat /dev/null >disk
cat /dev/null >cpu
cat /dev/null >mem




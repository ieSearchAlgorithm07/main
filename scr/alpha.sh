#!/bin/sh
alpha=$1
sum=1
sum=`echo "$2/$3"|bc -l`
i=0
echo $sum
while true
do
cat steepest_decent_test.c  | sed "s/alpha =.*/alpha = $alpha;/" > steepest_decent.c
make
echo "alpha = $alpha"
./run_ave.sh
sleep 1
alpha=`expr "$alpha + $2"|bc -l`
i=`expr $i + 1`

X=`echo "$3 > $alpha" | bc`
if [ $X -eq 0 ] ;then
	break;
fi

done
echo "finish"

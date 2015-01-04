#!/bin/sh
alpha=$1
while [ $alpha -le $3 ]
do
cat steepest_decent_test.c  | sed "s/alpha =.*/alpha = $alpha;/" > steepest_decent.c
make
echo "alpha = $alpha"
./run_ave.sh
sleep 1
alpha=`expr $alpha + $2`
done

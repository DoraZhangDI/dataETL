#!/bin/bash
#以小时循环
#sh x.sh 2017010101 2017010301
 
stime='2017050600'
etime='2017051208'
while [[ $stime -lt $etime ]]
do
    echo $stime
    y="${stime:0:4}"
    m="${stime:4:2}"
    d="${stime:6:2}"
    h="${stime:8:2}"
    echo $y,$m,$d,$h
    stime=$(date -d "${stime:0:8} ${stime:8:2} 1hour"  +%Y%m%d%H)
done

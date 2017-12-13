#!/bin/sh

set -x -e

addpartition='/root/csv2orc_rawdata/addPartition.hql'
hadoopput='/root/csv2orc_rawdata/hdfs.sh'
transerorc='/root/csv2orc_rawdata/transfer2orc.hql'

hive -f $addpartition
bash $hadoopput
hive -f $transerorc

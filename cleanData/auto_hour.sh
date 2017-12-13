#!/bin/bash
#以小时循环
#sh x.sh 2017010101 2017010301

set -x -e

stime='2017050600'
#etime='2017051208'
etime='2017050601'

DIR=/root/cleanData/
source $DIR/conf.sh

while [[ $stime -lt $etime ]]
do
    y="${stime:0:4}"
    m="${stime:4:2}"
    d="${stime:6:2}"
    h="${stime:8:2}"
    echo $stime,$y,$m,$d,$h
    stime=$(date -d "${stime:0:8} ${stime:8:2} 1hour"  +%Y%m%d%H)
    $HIVE <<-BBBB
    set hive.vectorized.execution.enabled=false;
    ADD FILE $DIR/transform.py;
    INSERT OVERWRITE TABLE hd_middledata_tmp
    PARTITION (y='$y',m='$m',d='$d',h='$h')
    SELECT TRANSFORM(gettime,shangx,shangy,xiax,xiay,shuix,shuiy,shangjjx,shangjjy,shangjjz,dingjjx,dingjjy,xiajjx,xiajjy,xiajjz,dinggx,dinggy,dinggz,dingzh1,dingzh2,dingzh3,dingzv1,dingzv2,dingzv3,ylmddg,ylmdwy,ylmdwk,ylmdshang,ylmdxia,wkyc,bqfs,active_power,reactive_power,vane_open,backup,waterhead,exc_current,exc_voltage,zs,flow)
    USING 'python transform.py'
    AS(gettime, shangxffzs, shangxffzmin, shangxffzmax, shangxffzmean, shangxxfs, shangxxf1, shangxxf2, shangyffzs, shangyffzmin, shangyffzmax, shangyffzmean, shangyxfs, shangyxf1, shangyxf2, xiaxffzs, xiaxffzmin, xiaxffzmax, xiaxffzmean, xiaxxfs, xiaxxf1, xiaxxf2, xiayffzs, xiayffzmin, xiayffzmax, xiayffzmean, xiayxfs, xiayxf1, xiayxf2, shuixffzs, shuixffzmin, shuixffzmax, shuixffzmean, shuixxfs, shuixxf1, shuixxf2, shuiyffzs, shuiyffzmin, shuiyffzmax, shuiyffzmean, shuiyxfs, shuiyxf1, shuiyxf2, shangjjxffzs, shangjjxffzmin, shangjjxffzmax, shangjjxffzmean, shangjjxxfs, shangjjxxf1, shangjjxxf2, shangjjyffzs, shangjjyffzmin, shangjjyffzmax, shangjjyffzmean, shangjjyxfs, shangjjyxf1, shangjjyxf2, shangjjzffzs, shangjjzffzmin, shangjjzffzmax, shangjjzffzmean, shangjjzxfs, shangjjzxf1, shangjjzxf2, dingjjxffzs, dingjjxffzmin, dingjjxffzmax, dingjjxffzmean, dingjjxxfs, dingjjxxf1, dingjjxxf2, dingjjyffzs, dingjjyffzmin, dingjjyffzmax, dingjjyffzmean, dingjjyxfs, dingjjyxf1, dingjjyxf2, xiajjxffzs, xiajjxffzmin, xiajjxffzmax, xiajjxffzmean, xiajjxxfs, xiajjxxf1, xiajjxxf2, xiajjyffzs, xiajjyffzmin, xiajjyffzmax, xiajjyffzmean, xiajjyxfs, xiajjyxf1, xiajjyxf2, xiajjzffzs, xiajjzffzmin, xiajjzffzmax, xiajjzffzmean, xiajjzxfs, xiajjzxf1, xiajjzxf2, dinggxffzs, dinggxffzmin, dinggxffzmax, dinggxffzmean, dinggxxfs, dinggxxf1, dinggxxf2, dinggyffzs, dinggyffzmin, dinggyffzmax, dinggyffzmean, dinggyxfs, dinggyxf1, dinggyxf2, dinggzffzs, dinggzffzmin, dinggzffzmax, dinggzffzmean, dinggzxfs, dinggzxf1, dinggzxf2, dingzh1ffzs, dingzh1ffzmin, dingzh1ffzmax, dingzh1ffzmean, dingzh1xfs, dingzh1xf1, dingzh1xf2, dingzh2ffzs, dingzh2ffzmin, dingzh2ffzmax, dingzh2ffzmean, dingzh2xfs, dingzh2xf1, dingzh2xf2, dingzh3ffzs, dingzh3ffzmin, dingzh3ffzmax, dingzh3ffzmean, dingzh3xfs, dingzh3xf1, dingzh3xf2, dingzv1ffzs, dingzv1ffzmin, dingzv1ffzmax, dingzv1ffzmean, dingzv1xfs, dingzv1xf1, dingzv1xf2, dingzv2ffzs, dingzv2ffzmin, dingzv2ffzmax, dingzv2ffzmean, dingzv2xfs, dingzv2xf1, dingzv2xf2, dingzv3ffzs, dingzv3ffzmin, dingzv3ffzmax, dingzv3ffzmean, dingzv3xfs, dingzv3xf1, dingzv3xf2, ylmddgffzs, ylmddgffzmin, ylmddgffzmax, ylmddgffzmean, ylmddgxfs, ylmddgxf1, ylmddgxf2, ylmdwyffzs, ylmdwyffzmin, ylmdwyffzmax, ylmdwyffzmean, ylmdwyxfs, ylmdwyxf1, ylmdwyxf2, ylmdwkffzs, ylmdwkffzmin, ylmdwkffzmax, ylmdwkffzmean, ylmdwkxfs, ylmdwkxf1, ylmdwkxf2, ylmdshangffzs, ylmdshangffzmin, ylmdshangffzmax, ylmdshangffzmean, ylmdshangxfs, ylmdshangxf1, ylmdshangxf2, ylmdxiaffzs, ylmdxiaffzmin, ylmdxiaffzmax, ylmdxiaffzmean, ylmdxiaxfs, ylmdxiaxf1, ylmdxiaxf2, wkycmvs, wkycmvmin, wkycmvmax, wkycmvmean, bqfsmvs, bqfsmvmin, bqfsmvmax, bqfsmvmean, active_powermvs, active_powermvmin, active_powermvmax, active_powermvmean, reactive_powermvs, reactive_powermvmin, reactive_powermvmax, reactive_powermvmean, vane_openmvs, vane_openmvmin, vane_openmvmax, vane_openmvmean, backupmvs, backupmvmin, backupmvmax, backupmvmean, waterheadmvs, waterheadmvmin, waterheadmvmax, waterheadmvmean, exc_currentmvs, exc_currentmvmin, exc_currentmvmax, exc_currentmvmean, exc_voltagemvs, exc_voltagemvmin, exc_voltagemvmax, exc_voltagemvmean, zsmvs, zsmvmin, zsmvmax, zsmvmean, flowmvs, flowmvmin, flowmvmax, flowmvmean)
    FROM hd_rawdata_tmp where y='$y' and m='$m' and d='$d' and h='$h' limit 10000;
BBBB
done

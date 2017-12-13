#coding:utf-8

import os

def dirlist(path, allfile):
    filelist =  os.listdir(path)

    for filename in filelist:
        filepath = os.path.join(path, filename)
        if os.path.isdir(filepath):
            dirlist(filepath, allfile)
        else:
            if 'csv' in filepath:
                allfile.append(filepath)
    return allfile

allcsv = dirlist("/home/data/hd", [])    

addPartition = open('addPartition.hql', 'w')
hdfs = open('hdfs.sh', 'w')
transfer2orc = open('transfer2orc.hql', 'w')

for c in allcsv:
    ymdh = c.split('.')[0].split('/')[-1]
    sa = "alter table hd_rawdata_tmp add partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"');"
    addPartition.write(sa + '\n')
    sh = 'hadoop fs -put '+c+' /user/root/hd24/y='+ymdh[:4]+'/m='+ymdh[4:6]+'/d='+ymdh[6:8]+'/h='+ymdh[8:]
    hdfs.write(sh + '\n')
    #si = "insert overwrite table hd_rawdata_ext_orc partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"') select substr(gettime,15),shangx,shangy,xiax,xiay,shuix,shuiy,shangjjx,shangjjy,shangjjz,dingjjx,dingjjy,xiajjx,xiajjy,xiajjz,dinggx,dinggy,dinggz,dingzh1,dingzh2,dingzh3,dingzv1,dingzv2,dingzv3,ylmddg,ylmdwy,ylmdwk,ylmdshang,ylmdxia,wkyc,bqfs,active_power,reactive_power,vane_open,backup,waterhead,exc_current,exc_voltage,var1,var2,var3,zs,flow from hd_rawdata_tmp where y='"+ymdh[:4]+"' and m='"+ymdh[4:6]+"' and d='"+ymdh[6:8]+"' and h='"+ymdh[8:]+"';"
    si = "insert overwrite table hd_rawdata_ext_orc partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"') select gettime,round(shangx/10,1),round(shangy/10,1),round(xiax/10,1),round(xiay/10,1),round(shuix/10,1),round(shuiy/10,1),round(shangjjx/10,1),round(shangjjy/10,1),round(shangjjz/10,1),round(dingjjx/10,1),round(dingjjy/10,1),round(xiajjx/10,1),round(xiajjy/10,1),round(xiajjz/10,1),round(dinggx/10,1),round(dinggy/10,1),round(dinggz/10,1),round(dingzh1/10,1),round(dingzh2/10,1),round(dingzh3/10,1),round(dingzv1/10,1),round(dingzv2/10,1),round(dingzv3/10,1),round(ylmddg/10,1),round(ylmdwy/10,1),round(ylmdwk/10,1),round(ylmdshang/10,1),round(ylmdxia/10,1),round(wkyc/10,1),round(bqfs/10,1),round(active_power/10,1),round(reactive_power/10,1),round(vane_open/10,1),round(backup/10,1),round(waterhead/10,1),round(exc_current/10,1),round(exc_voltage/10,1),round(var1/10,1),round(var2/10,1),round(var3/10,1),round(zs/10,1),round(flow/10,1) from hd_rawdata_tmp where y='"+ymdh[:4]+"' and m='"+ymdh[4:6]+"' and d='"+ymdh[6:8]+"' and h='"+ymdh[8:]+"';"
    transfer2orc.write(si + '\n')

addPartition.close()
hdfs.close()
transfer2orc.close()

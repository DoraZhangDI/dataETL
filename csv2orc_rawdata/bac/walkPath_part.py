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

allcsv = dirlist("/home/data/hd24", [])	

partitionExist = set()
f_read = open('partitionExist')
for l in f_read:
    partitionExist.add(l.strip())
f_read.close()

addPartition = open('addPartition.hql', 'w')
hdfs = open('hdfs.sh', 'w')
transfer2orc = open('transfer2orc.hql', 'w')

for c in allcsv:
    if c in partitionExist:
        continue
    ymdh = c.split('.')[0].split('/')[-1]
    sa = "alter table hd_rawdata_tmp add partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"');"
    addPartition.write(sa + '\n')
    sh = 'hadoop fs -put '+c+' /user/root/hd24/y='+ymdh[:4]+'/m='+ymdh[4:6]+'/d='+ymdh[6:8]+'/h='+ymdh[8:]
    hdfs.write(sh + '\n')
    si = "insert overwrite table hd_rawdata_ext_orc partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"') select gettime,shangx,shangy,xiax,xiay,shuix,shuiy,shangjjx,shangjjy,shangjjz,dingjjx,dingjjy,xiajjx,xiajjy,xiajjz,dinggx,dinggy,dinggz,dingzh1,dingzh2,dingzh3,dingzv1,dingzv2,dingzv3,ylmddg,ylmdwy,ylmdwk,ylmdshang,ylmdxia,wkyc,bqfs,active_power,reactive_power,vane_open,backup,waterhead,exc_current,exc_voltage,var1,var2,var3,zs,flow from hd_rawdata_tmp where y='"+ymdh[:4]+"' and m='"+ymdh[4:6]+"' and d='"+ymdh[6:8]+"' and h='"+ymdh[8:]+"';"
    transfer2orc.write(si + '\n')

addPartition.close()
hdfs.close()
transfer2orc.close()

f_write = open('partitionExist', 'w')
for c in allcsv:
    f_write.write(c+'\n')
f_write.close()

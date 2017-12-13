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

#dirs = set()
#    dirs.add('/home/data/hd_xfs/' + c[14:22])
#for dd in dirs:
#    os.mkdir(dd)

addPartition = open('addPartition.hql', 'w')
hdfs = open('hdfs.sh', 'w')
allcsv = dirlist("/home/data/hd_xfs", [])    
for c in allcsv:
    #cat /home/data/hd/20170506/2017050600.csv | /usr/bin/python /home/zd/hive2orc_generate_middleData/ffz_mean_middleData.py  >> /home/data/hd_ffz_mean/20170506.csv
    #print 'cat ' + c + ' | /usr/bin/python /home/zd/compute_xfs/xfs.py > /home/data/hd_xfs/' + c[14:33] + '.csv'

    ymdh = c.split('.')[0].split('/')[-1]
    sa = "alter table hd_middledata_all_xfs_tmp add partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"',h='"+ymdh[8:]+"');"
    addPartition.write(sa + '\n')
    sh = 'hadoop fs -put '+c+' /user/root/hd_all_xfs/y='+ymdh[:4]+'/m='+ymdh[4:6]+'/d='+ymdh[6:8]+'/h='+ymdh[8:]
    hdfs.write(sh + '\n')

addPartition.close()
hdfs.close()

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

#auto_compute = open('comp.sh','w')

addPartition = open('addPartition.hql', 'w')
hdfs = open('hdfs.sh', 'w')
#step 1: open ffz_mean data directory
#allcsv = dirlist("/home/data/hd_ffz_mean", [])    

#step 2: open finished trend data directory to add to hive
allcsv = dirlist("/home/data/hd_trend_1min", [])    
for c in allcsv:
    # step 1: generate bash script to execute; e.g. cat /home/data/hd_ffz_mean/20170530.csv | /usr/bin/python /home/zd/trend/generate_trend.py > /home/data/hd_trend_1min/20170530.csv
    #sc = 'cat ' + c + ' | /usr/bin/python /home/zd/trend/generate_trend.py > /home/data/hd_trend_1min/' + c[23:31] + '.csv'
    #auto_compute.write(sc + '\n')

    # step 2: generate hdfs & hql to add data to hdfs and add partitions
    ymdh = c.split('.')[0].split('/')[-1]
    sa = "alter table hd_trend_1min_tmp add partition(y='"+ymdh[:4]+"',m='"+ymdh[4:6]+"',d='"+ymdh[6:8]+"');"
    addPartition.write(sa + '\n')
    sh = 'hadoop fs -put '+c+' /user/root/hd_trend_1min/y='+ymdh[:4]+'/m='+ymdh[4:6]+'/d='+ymdh[6:8]
    hdfs.write(sh + '\n')
#auto_compute.close()
addPartition.close()
hdfs.close()

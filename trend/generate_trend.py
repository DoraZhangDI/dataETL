#coding=utf-8
"""
    10/14/17,14:33,2017
    BY DoraZhang
"""
import numpy as np
import time
from datetime import datetime
import traceback
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

def dt2ts(dt):
    t = dt
    s = 0
    if len(dt)>19:
        t,s = dt.split('.')
    dd = datetime.strptime(t, '%Y-%m-%d %H:%M:%S')
    return time.mktime(dd.timetuple())*1000 + int(s)/1000

def convert2fields(tss, dfs):
    X = [dt2ts(x) for x in tss]
    re = [tss[-1]]
    for i in range(dfs.shape[1]):
        re.append(str(np.polyfit(X, dfs[:,i], 1)[0]))
    return re

def timediff(a,b):
    dx = dt2ts(b)-dt2ts(a)
    if dx > 60000:
        return 1
    return 0

if __name__ == '__main__':
    slide_window=8
    try:
        dataframe = []
        timeseries = []
        for line in sys.stdin:
            allfields = line.rstrip().split(',')
            gettime = allfields[0]
            items = [float(x)/10 for x in allfields[1:]]
            dataframe.append(items)
            timeseries.append(gettime)
            re_default = [gettime]+['0']*39
            
            if len(dataframe) > slide_window and timediff(timeseries[0],timeseries[-1]):
                print ','.join(convert2fields(timeseries, np.array(dataframe)))
                del timeseries[0]
                del dataframe[0]
            else:
                print ','.join(re_default)

    except BaseException as e:
        msg = traceback.format_exc()
        #print msg

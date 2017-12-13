#coding=utf-8
"""
    10/14/17,14:33,2017
    BY DoraZhang
"""
import numpy as np
import math 
from datetime import datetime
import json
import traceback
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

def computeFFT(d, __fs, __circleNo, slide_window):
    transformed = np.abs(np.fft.rfft(d))
    re = transformed/float(slide_window/2)
    #计算倍频脚标
    f_step = float(__fs)/float(slide_window)
    f_data = float(__fs)/float(__circleNo)
    xf_index = int(f_data/f_step)
    #print xf_index
    return re

def convert2fields(gettime, df):
    kbl = {'shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia'}
    fieldname = ['gettime','shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia','wkyc','bqfs','active_power','reactive_power','vane_open','backup','waterhead','exc_current','exc_voltage','zs','flow']
    
    slide_window = 512*8
    __fs = 640
    __circleNo = 512

    d = np.array(df)

    #allAfterFields = [gettime]
    allAfterFields = [gettime[:19]]
    for i in range(1,len(fieldname)):
        if fieldname[i] in kbl:
            xfs = computeFFT(d[:,i-1], __fs, __circleNo, slide_window)
            allAfterFields += ['/'.join([str(s) for s in xfs])]
    #print len(allAfterFields)
    return allAfterFields
#   data = []
#   data.append(xx)
#   self.npdata = np.array(data[:self.dataLength])

if __name__ == '__main__':
    try:
        kbl = {'shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia'}
        fieldname = ['gettime','shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia','wkyc','bqfs','active_power','reactive_power','vane_open','backup','waterhead','exc_current','exc_voltage','zs','flow']
        slide_window = 512*8
        __fs = 640
        __circleNo = 512
    
        fieldname_meaning = {'gettime':'获取时间','shangx':'上导X摆度','shangy':'上导Y摆度','xiax':'下导X摆度','xiay':'下导Y摆度','shuix':'水导X摆度','shuiy':'水导Y摆度','shangjjx':'上机架X向水平振动','shangjjy':'上机架Y向水平振动','shangjjz':'上机架Z向垂直振动','dingjjx':'定子机架X向水平振动','dingjjy':'定子机架Y向水平振动','xiajjx':'下机架X向水平振动','xiajjy':'下机架Y向水平振动','xiajjz':'下机架Z向垂直振动','dinggx':'顶盖X向水平振动','dinggy':'顶盖Y向水平振动','dinggz':'顶盖Z向垂直振动','dingzh1':'定子铁芯水平振动1','dingzh2':'定子铁芯水平振动2','dingzh3':'定子铁芯水平振动3','dingzv1':'定子铁芯垂直振动1','dingzv2':'定子铁芯垂直振动2','dingzv3':'定子铁芯垂直振动3','ylmddg':'顶盖下压力脉动','ylmdwy':'无叶区压力脉动','ylmdwk':'蜗壳进口压力脉动','ylmdshang':'尾水管上游侧压力脉动','ylmdxia':'尾水管下游侧压力脉动','wkyc':'蜗壳压差','bqfs':'补气风速','active_power':'有功功率','reactive_power':'无功功率','vane_open':'导叶开度','backup':'备用','waterhead':'静水头','exc_current':'励磁电流','exc_voltage':'励磁电压','var1':'不知道','var2':'不知道','var3':'不知道','zs':'转速','flow':'蜗壳差压流量'}
    
        postfix_kbl_meaning=['倍频值']
        postfix_kbl=['_xfs']
    
        aftername = ['gettime']
        aftername_meaning = ['时间']
    
        for i in range(1,len(fieldname)):
            if fieldname[i] in kbl:
                aftername_meaning += [fieldname_meaning[fieldname[i]]+ j for j in postfix_kbl_meaning]
                aftername += [fieldname[i]+ j for j in postfix_kbl]
        #print aftername, json.dumps(aftername_meaning,ensure_ascii=False),len(aftername),len(aftername_meaning)
#        for i in range(len(aftername)):
#            print aftername[i], json.dumps(aftername_meaning[i],ensure_ascii=False)
        
        dataframe = []
        timeseries = []
        for line in sys.stdin:
            gettime = line.rstrip().split(',')[0]
            items = [float(x)/10 for x in line.rstrip().split(',')[1:]]
            #gettime = line.rstrip().split('\t')[0]
            #items = [float(x)/10 for x in line.rstrip().split('\t')[1:]]
            dataframe.append(items)
            timeseries.append(gettime)
            if len(dataframe) >= slide_window:
                #convert2fields(timeseries[0], np.array(dataframe))
                print ','.join(convert2fields(timeseries[0], np.array(dataframe)))
                #print computeTime(timeseries[-1], timeseries[-2]), len(timeseries), timeseries[-2:]
                dataframe = []
                timeseries = []
    except BaseException as e:
        msg = traceback.format_exc()
        #print msg

#!/usr/bin/python
#coding=utf-8
"""
	10/14/17,14:33,2017
	BY DoraZhang
"""
import numpy as np
import math 
from datetime import datetime
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

def timeDelta(a,b):
	ta = transferTime(a)
	tb = transferTime(b)
	return (ta-tb).microseconds

def transferTime(a):
	if len(a) > 19:
		return datetime.strptime(a,'%Y-%m-%d %H:%M:%S.%f')
	else:
		return datetime.strptime(a,'%Y-%m-%d %H:%M:%S')

def computeTime(a, b):
	dt = timeDelta(a, b)
	if dt > 1562:
		return 1
	else:
		return 0

#	a = set()
#	for i in range(1,l):
#		dt = timeDelta(timeseries[i],timeseries[i-1])
#		if dt > 1562:
#			print dt,timeseries[i-1],timeseries[i]
#		a.add(dt)
#	print a

def getffz(x):
	return round(x.ptp(), 1)

def getallffz(v):
	ffz = []
	for i in range(v.shape[0]/512):
		ffz.append(getffz(v[512*i:512*(i+1),]))
#	print ffz, np.min(ffz), np.max(ffz), np.mean(ffz)
	return ffz, np.min(ffz), np.max(ffz), np.mean(ffz)

def computeFFT(d, __fs, __circleNo, slide_window):
	transformed = np.abs(np.fft.rfft(d))
	re = transformed/float(slide_window/2)
	#计算倍频脚标
	f_step = float(__fs)/float(slide_window)
	f_data = float(__fs)/float(__circleNo)
	xf_index = int(f_data/f_step)
	#输出直流通量，基频，2x频
	#x_array = [1/4.0,1/3.0,1/2.0] + list(np.arange(1,10.5,0.5))
	x_array = [1/4,1/3,1/2] + list(np.arange(1,10.5,0.5))
	xf = []
	for i in x_array:
		xf.append(round(re[int(i*xf_index)], 4))
		#xf.append(re[int(i*xf_index)])
#	print xf, xf[3], xf[5]
	return xf, xf[3], xf[5]

def getmean(v):
	meanValues = []
	for i in range(v.shape[0]/512):
		meanValues.append(round(np.mean(v[512*i:512*(i+1),]), 1))
	#print meanValues, np.min(meanValues), np.max(meanValues), np.mean(meanValues)
#	print meanValues, np.min(meanValues), np.max(meanValues), np.mean(meanValues)
	return meanValues, np.min(meanValues), np.max(meanValues), np.mean(meanValues)

def convert2fields(gettime, df):
	kbl = {'shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia'}
	fieldname = ['gettime','shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia','wkyc','bqfs','active_power','reactive_power','vane_open','backup','waterhead','exc_current','exc_voltage','zs','flow']
	
	slide_window = 512*8
	__fs = 640
	__circleNo = 512

	d = np.array(df)

	allAfterFields = [gettime]
	for i in range(1,len(fieldname)):
		if fieldname[i] in kbl:
			ffzs, ffzmin, ffzmax, ffzmean = getallffz(d[:,i-1])
			xfs, xf1, xf2 = computeFFT(d[:,i-1], __fs, __circleNo, slide_window)
			allAfterFields += ['/'.join([str(s) for s in ffzs])] + [str(ffzmin), str(ffzmax), str(ffzmean)] + ['/'.join([str(s) for s in xfs])] + [str(xf1), str(xf2)]
		else:
			mvs, mvmin, mvmax, mvmean = getmean(d[:,i-1])
			allAfterFields += ['/'.join([str(s) for s in mvs])] + [str(mvmin), str(mvmax), str(mvmean)]
#	print len(allAfterFields)
	return allAfterFields
#	data = []
#	data.append(xx)
#	self.npdata = np.array(data[:self.dataLength])

if __name__ == '__main__':

	kbl = {'shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia'}
	fieldname = ['gettime','shangx','shangy','xiax','xiay','shuix','shuiy','shangjjx','shangjjy','shangjjz','dingjjx','dingjjy','xiajjx','xiajjy','xiajjz','dinggx','dinggy','dinggz','dingzh1','dingzh2','dingzh3','dingzv1','dingzv2','dingzv3','ylmddg','ylmdwy','ylmdwk','ylmdshang','ylmdxia','wkyc','bqfs','active_power','reactive_power','vane_open','backup','waterhead','exc_current','exc_voltage','zs','flow']
	slide_window = 512*8
	__fs = 640
	__circleNo = 512

	postfix_kbl=['ffzs','ffzmin','ffzmax','ffzmean','xfs','xf1','xf2']
	postfix_mbl=['mvs','mvmin','mvmax','mvmean']

	aftername = ['gettime']

	for i in range(1,len(fieldname)):
		if fieldname[i] in kbl:
			aftername += [fieldname[i]+ j for j in postfix_kbl]
		else:
			aftername += [fieldname[i]+ j for j in postfix_mbl]
#   print aftername, len(aftername)
	dataframe = []
	timeseries = []
#	f = open('rawdata1w')
#	for line in f:
	for line in sys.stdin:
		try:
			gettime = line.rstrip().split('\t')[0]
			items = [float(x)/10 for x in line.rstrip().split('\t')[1:]]
			dataframe.append(items)
			timeseries.append(gettime)
			if len(dataframe) >= slide_window:
				print ','.join(convert2fields(timeseries[0], np.array(dataframe)))
				#print computeTime(timeseries[-1], timeseries[-2]), len(timeseries), timeseries[-2:]
				dataframe = []
				timeseries = []

		except Exception,err:
			#print err
			continue
	if len(timeseries) >= slide_window:
		convert2fields(np.array(dataframe))
		

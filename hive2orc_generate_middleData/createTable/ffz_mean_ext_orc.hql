CREATE EXTERNAL TABLE hd_premiddledata_ffz_mean_ext_orc (
gettime timestamp COMMENT '时间',
shangx_ffz float COMMENT '上导X摆度峰峰值',
shangy_ffz float COMMENT '上导Y摆度峰峰值',
xiax_ffz float COMMENT '下导X摆度峰峰值',
xiay_ffz float COMMENT '下导Y摆度峰峰值',
shuix_ffz float COMMENT '水导X摆度峰峰值',
shuiy_ffz float COMMENT '水导Y摆度峰峰值',
shangjjx_ffz float COMMENT '上机架X向水平振动峰峰值',
shangjjy_ffz float COMMENT '上机架Y向水平振动峰峰值',
shangjjz_ffz float COMMENT '上机架Z向垂直振动峰峰值',
dingjjx_ffz float COMMENT '定子机架X向水平振动峰峰值',
dingjjy_ffz float COMMENT '定子机架Y向水平振动峰峰值',
xiajjx_ffz float COMMENT '下机架X向水平振动峰峰值',
xiajjy_ffz float COMMENT '下机架Y向水平振动峰峰值',
xiajjz_ffz float COMMENT '下机架Z向垂直振动峰峰值',
dinggx_ffz float COMMENT '顶盖X向水平振动峰峰值',
dinggy_ffz float COMMENT '顶盖Y向水平振动峰峰值',
dinggz_ffz float COMMENT '顶盖Z向垂直振动峰峰值',
dingzh1_ffz float COMMENT '定子铁芯水平振动1峰峰值',
dingzh2_ffz float COMMENT '定子铁芯水平振动2峰峰值',
dingzh3_ffz float COMMENT '定子铁芯水平振动3峰峰值',
dingzv1_ffz float COMMENT '定子铁芯垂直振动1峰峰值',
dingzv2_ffz float COMMENT '定子铁芯垂直振动2峰峰值',
dingzv3_ffz float COMMENT '定子铁芯垂直振动3峰峰值',
ylmddg_ffz float COMMENT '顶盖下压力脉动峰峰值',
ylmdwy_ffz float COMMENT '无叶区压力脉动峰峰值',
ylmdwk_ffz float COMMENT '蜗壳进口压力脉动峰峰值',
ylmdshang_ffz float COMMENT '尾水管上游侧压力脉动峰峰值',
ylmdxia_ffz float COMMENT '尾水管下游侧压力脉动峰峰值',
wkyc_mv float COMMENT '蜗壳压差平均值',
bqfs_mv float COMMENT '补气风速平均值',
active_power_mv float COMMENT '有功功率平均值',
reactive_power_mv float COMMENT '无功功率平均值',
vane_open_mv float COMMENT '导叶开度平均值',
backup_mv float COMMENT '备用平均值',
waterhead_mv float COMMENT '静水头平均值',
exc_current_mv float COMMENT '励磁电流平均值',
exc_voltage_mv float COMMENT '励磁电压平均值',
zs_mv float COMMENT '转速平均值',
flow_mv float COMMENT '蜗壳差压流量平均值')
PARTITIONED BY (
  y string COMMENT '年份分区',
  m string COMMENT '月份分区',
  d string COMMENT '日期分区')
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ',' 
stored as orc ;

CREATE TABLE hd_middledata_all_xfs_tmp(
gettime TIMESTAMP COMMENT "时间",
shangx_xfs string COMMENT "上导X摆度倍频值",
shangy_xfs string COMMENT "上导Y摆度倍频值",
xiax_xfs string COMMENT "下导X摆度倍频值",
xiay_xfs string COMMENT "下导Y摆度倍频值",
shuix_xfs string COMMENT "水导X摆度倍频值",
shuiy_xfs string COMMENT "水导Y摆度倍频值",
shangjjx_xfs string COMMENT "上机架X向水平振动倍频值",
shangjjy_xfs string COMMENT "上机架Y向水平振动倍频值",
shangjjz_xfs string COMMENT "上机架Z向垂直振动倍频值",
dingjjx_xfs string COMMENT "定子机架X向水平振动倍频值",
dingjjy_xfs string COMMENT "定子机架Y向水平振动倍频值",
xiajjx_xfs string COMMENT "下机架X向水平振动倍频值",
xiajjy_xfs string COMMENT "下机架Y向水平振动倍频值",
xiajjz_xfs string COMMENT "下机架Z向垂直振动倍频值",
dinggx_xfs string COMMENT "顶盖X向水平振动倍频值",
dinggy_xfs string COMMENT "顶盖Y向水平振动倍频值",
dinggz_xfs string COMMENT "顶盖Z向垂直振动倍频值",
dingzh1_xfs string COMMENT "定子铁芯水平振动1倍频值",
dingzh2_xfs string COMMENT "定子铁芯水平振动2倍频值",
dingzh3_xfs string COMMENT "定子铁芯水平振动3倍频值",
dingzv1_xfs string COMMENT "定子铁芯垂直振动1倍频值",
dingzv2_xfs string COMMENT "定子铁芯垂直振动2倍频值",
dingzv3_xfs string COMMENT "定子铁芯垂直振动3倍频值",
ylmddg_xfs string COMMENT "顶盖下压力脉动倍频值",
ylmdwy_xfs string COMMENT "无叶区压力脉动倍频值",
ylmdwk_xfs string COMMENT "蜗壳进口压力脉动倍频值",
ylmdshang_xfs string COMMENT "尾水管上游侧压力脉动倍频值",
ylmdxia_xfs string COMMENT "尾水管下游侧压力脉动倍频值")
PARTITIONED BY (
  y string COMMENT '年份分区',
  m string COMMENT '月份分区',
  d string COMMENT '日期分区',
  h string COMMENT '小时分区')
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
location '/user/root/hd_all_xfs';

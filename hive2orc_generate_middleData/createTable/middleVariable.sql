use hd;
drop table middleVariable;
CREATE TABLE `middleVariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(50) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

insert into middleVariable (fieldname,comments) values
("gettime","时间"),
("shangx_ffzs","上导X摆度_峰峰值"),
("shangx_ffzmin","上导X摆度_峰峰值最小值"),
("shangx_ffzmax","上导X摆度_峰峰值最大值"),
("shangx_ffzmean","上导X摆度_峰峰值均值"),
("shangx_xfs","上导X摆度_倍频值"),
("shangx_xf1","上导X摆度_一倍频"),
("shangx_xf2","上导X摆度_二倍频"),
("shangy_ffzs","上导Y摆度_峰峰值"),
("shangy_ffzmin","上导Y摆度_峰峰值最小值"),
("shangy_ffzmax","上导Y摆度_峰峰值最大值"),
("shangy_ffzmean","上导Y摆度_峰峰值均值"),
("shangy_xfs","上导Y摆度_倍频值"),
("shangy_xf1","上导Y摆度_一倍频"),
("shangy_xf2","上导Y摆度_二倍频"),
("xiax_ffzs","下导X摆度_峰峰值"),
("xiax_ffzmin","下导X摆度_峰峰值最小值"),
("xiax_ffzmax","下导X摆度_峰峰值最大值"),
("xiax_ffzmean","下导X摆度_峰峰值均值"),
("xiax_xfs","下导X摆度_倍频值"),
("xiax_xf1","下导X摆度_一倍频"),
("xiax_xf2","下导X摆度_二倍频"),
("xiay_ffzs","下导Y摆度_峰峰值"),
("xiay_ffzmin","下导Y摆度_峰峰值最小值"),
("xiay_ffzmax","下导Y摆度_峰峰值最大值"),
("xiay_ffzmean","下导Y摆度_峰峰值均值"),
("xiay_xfs","下导Y摆度_倍频值"),
("xiay_xf1","下导Y摆度_一倍频"),
("xiay_xf2","下导Y摆度_二倍频"),
("shuix_ffzs","水导X摆度_峰峰值"),
("shuix_ffzmin","水导X摆度_峰峰值最小值"),
("shuix_ffzmax","水导X摆度_峰峰值最大值"),
("shuix_ffzmean","水导X摆度_峰峰值均值"),
("shuix_xfs","水导X摆度_倍频值"),
("shuix_xf1","水导X摆度_一倍频"),
("shuix_xf2","水导X摆度_二倍频"),
("shuiy_ffzs","水导Y摆度_峰峰值"),
("shuiy_ffzmin","水导Y摆度_峰峰值最小值"),
("shuiy_ffzmax","水导Y摆度_峰峰值最大值"),
("shuiy_ffzmean","水导Y摆度_峰峰值均值"),
("shuiy_xfs","水导Y摆度_倍频值"),
("shuiy_xf1","水导Y摆度_一倍频"),
("shuiy_xf2","水导Y摆度_二倍频"),
("shangjjx_ffzs","上机架X向水平振动_峰峰值"),
("shangjjx_ffzmin","上机架X向水平振动_峰峰值最小值"),
("shangjjx_ffzmax","上机架X向水平振动_峰峰值最大值"),
("shangjjx_ffzmean","上机架X向水平振动_峰峰值均值"),
("shangjjx_xfs","上机架X向水平振动_倍频值"),
("shangjjx_xf1","上机架X向水平振动_一倍频"),
("shangjjx_xf2","上机架X向水平振动_二倍频"),
("shangjjy_ffzs","上机架Y向水平振动_峰峰值"),
("shangjjy_ffzmin","上机架Y向水平振动_峰峰值最小值"),
("shangjjy_ffzmax","上机架Y向水平振动_峰峰值最大值"),
("shangjjy_ffzmean","上机架Y向水平振动_峰峰值均值"),
("shangjjy_xfs","上机架Y向水平振动_倍频值"),
("shangjjy_xf1","上机架Y向水平振动_一倍频"),
("shangjjy_xf2","上机架Y向水平振动_二倍频"),
("shangjjz_ffzs","上机架Z向垂直振动_峰峰值"),
("shangjjz_ffzmin","上机架Z向垂直振动_峰峰值最小值"),
("shangjjz_ffzmax","上机架Z向垂直振动_峰峰值最大值"),
("shangjjz_ffzmean","上机架Z向垂直振动_峰峰值均值"),
("shangjjz_xfs","上机架Z向垂直振动_倍频值"),
("shangjjz_xf1","上机架Z向垂直振动_一倍频"),
("shangjjz_xf2","上机架Z向垂直振动_二倍频"),
("dingjjx_ffzs","定子机架X向水平振动_峰峰值"),
("dingjjx_ffzmin","定子机架X向水平振动_峰峰值最小值"),
("dingjjx_ffzmax","定子机架X向水平振动_峰峰值最大值"),
("dingjjx_ffzmean","定子机架X向水平振动_峰峰值均值"),
("dingjjx_xfs","定子机架X向水平振动_倍频值"),
("dingjjx_xf1","定子机架X向水平振动_一倍频"),
("dingjjx_xf2","定子机架X向水平振动_二倍频"),
("dingjjy_ffzs","定子机架Y向水平振动_峰峰值"),
("dingjjy_ffzmin","定子机架Y向水平振动_峰峰值最小值"),
("dingjjy_ffzmax","定子机架Y向水平振动_峰峰值最大值"),
("dingjjy_ffzmean","定子机架Y向水平振动_峰峰值均值"),
("dingjjy_xfs","定子机架Y向水平振动_倍频值"),
("dingjjy_xf1","定子机架Y向水平振动_一倍频"),
("dingjjy_xf2","定子机架Y向水平振动_二倍频"),
("xiajjx_ffzs","下机架X向水平振动_峰峰值"),
("xiajjx_ffzmin","下机架X向水平振动_峰峰值最小值"),
("xiajjx_ffzmax","下机架X向水平振动_峰峰值最大值"),
("xiajjx_ffzmean","下机架X向水平振动_峰峰值均值"),
("xiajjx_xfs","下机架X向水平振动_倍频值"),
("xiajjx_xf1","下机架X向水平振动_一倍频"),
("xiajjx_xf2","下机架X向水平振动_二倍频"),
("xiajjy_ffzs","下机架Y向水平振动_峰峰值"),
("xiajjy_ffzmin","下机架Y向水平振动_峰峰值最小值"),
("xiajjy_ffzmax","下机架Y向水平振动_峰峰值最大值"),
("xiajjy_ffzmean","下机架Y向水平振动_峰峰值均值"),
("xiajjy_xfs","下机架Y向水平振动_倍频值"),
("xiajjy_xf1","下机架Y向水平振动_一倍频"),
("xiajjy_xf2","下机架Y向水平振动_二倍频"),
("xiajjz_ffzs","下机架Z向垂直振动_峰峰值"),
("xiajjz_ffzmin","下机架Z向垂直振动_峰峰值最小值"),
("xiajjz_ffzmax","下机架Z向垂直振动_峰峰值最大值"),
("xiajjz_ffzmean","下机架Z向垂直振动_峰峰值均值"),
("xiajjz_xfs","下机架Z向垂直振动_倍频值"),
("xiajjz_xf1","下机架Z向垂直振动_一倍频"),
("xiajjz_xf2","下机架Z向垂直振动_二倍频"),
("dinggx_ffzs","顶盖X向水平振动_峰峰值"),
("dinggx_ffzmin","顶盖X向水平振动_峰峰值最小值"),
("dinggx_ffzmax","顶盖X向水平振动_峰峰值最大值"),
("dinggx_ffzmean","顶盖X向水平振动_峰峰值均值"),
("dinggx_xfs","顶盖X向水平振动_倍频值"),
("dinggx_xf1","顶盖X向水平振动_一倍频"),
("dinggx_xf2","顶盖X向水平振动_二倍频"),
("dinggy_ffzs","顶盖Y向水平振动_峰峰值"),
("dinggy_ffzmin","顶盖Y向水平振动_峰峰值最小值"),
("dinggy_ffzmax","顶盖Y向水平振动_峰峰值最大值"),
("dinggy_ffzmean","顶盖Y向水平振动_峰峰值均值"),
("dinggy_xfs","顶盖Y向水平振动_倍频值"),
("dinggy_xf1","顶盖Y向水平振动_一倍频"),
("dinggy_xf2","顶盖Y向水平振动_二倍频"),
("dinggz_ffzs","顶盖Z向垂直振动_峰峰值"),
("dinggz_ffzmin","顶盖Z向垂直振动_峰峰值最小值"),
("dinggz_ffzmax","顶盖Z向垂直振动_峰峰值最大值"),
("dinggz_ffzmean","顶盖Z向垂直振动_峰峰值均值"),
("dinggz_xfs","顶盖Z向垂直振动_倍频值"),
("dinggz_xf1","顶盖Z向垂直振动_一倍频"),
("dinggz_xf2","顶盖Z向垂直振动_二倍频"),
("dingzh1_ffzs","定子铁芯水平振动1_峰峰值"),
("dingzh1_ffzmin","定子铁芯水平振动1_峰峰值最小值"),
("dingzh1_ffzmax","定子铁芯水平振动1_峰峰值最大值"),
("dingzh1_ffzmean","定子铁芯水平振动1_峰峰值均值"),
("dingzh1_xfs","定子铁芯水平振动1_倍频值"),
("dingzh1_xf1","定子铁芯水平振动1_一倍频"),
("dingzh1_xf2","定子铁芯水平振动1_二倍频"),
("dingzh2_ffzs","定子铁芯水平振动2_峰峰值"),
("dingzh2_ffzmin","定子铁芯水平振动2_峰峰值最小值"),
("dingzh2_ffzmax","定子铁芯水平振动2_峰峰值最大值"),
("dingzh2_ffzmean","定子铁芯水平振动2_峰峰值均值"),
("dingzh2_xfs","定子铁芯水平振动2_倍频值"),
("dingzh2_xf1","定子铁芯水平振动2_一倍频"),
("dingzh2_xf2","定子铁芯水平振动2_二倍频"),
("dingzh3_ffzs","定子铁芯水平振动3_峰峰值"),
("dingzh3_ffzmin","定子铁芯水平振动3_峰峰值最小值"),
("dingzh3_ffzmax","定子铁芯水平振动3_峰峰值最大值"),
("dingzh3_ffzmean","定子铁芯水平振动3_峰峰值均值"),
("dingzh3_xfs","定子铁芯水平振动3_倍频值"),
("dingzh3_xf1","定子铁芯水平振动3_一倍频"),
("dingzh3_xf2","定子铁芯水平振动3_二倍频"),
("dingzv1_ffzs","定子铁芯垂直振动1_峰峰值"),
("dingzv1_ffzmin","定子铁芯垂直振动1_峰峰值最小值"),
("dingzv1_ffzmax","定子铁芯垂直振动1_峰峰值最大值"),
("dingzv1_ffzmean","定子铁芯垂直振动1_峰峰值均值"),
("dingzv1_xfs","定子铁芯垂直振动1_倍频值"),
("dingzv1_xf1","定子铁芯垂直振动1_一倍频"),
("dingzv1_xf2","定子铁芯垂直振动1_二倍频"),
("dingzv2_ffzs","定子铁芯垂直振动2_峰峰值"),
("dingzv2_ffzmin","定子铁芯垂直振动2_峰峰值最小值"),
("dingzv2_ffzmax","定子铁芯垂直振动2_峰峰值最大值"),
("dingzv2_ffzmean","定子铁芯垂直振动2_峰峰值均值"),
("dingzv2_xfs","定子铁芯垂直振动2_倍频值"),
("dingzv2_xf1","定子铁芯垂直振动2_一倍频"),
("dingzv2_xf2","定子铁芯垂直振动2_二倍频"),
("dingzv3_ffzs","定子铁芯垂直振动3_峰峰值"),
("dingzv3_ffzmin","定子铁芯垂直振动3_峰峰值最小值"),
("dingzv3_ffzmax","定子铁芯垂直振动3_峰峰值最大值"),
("dingzv3_ffzmean","定子铁芯垂直振动3_峰峰值均值"),
("dingzv3_xfs","定子铁芯垂直振动3_倍频值"),
("dingzv3_xf1","定子铁芯垂直振动3_一倍频"),
("dingzv3_xf2","定子铁芯垂直振动3_二倍频"),
("ylmddg_ffzs","顶盖下压力脉动_峰峰值"),
("ylmddg_ffzmin","顶盖下压力脉动_峰峰值最小值"),
("ylmddg_ffzmax","顶盖下压力脉动_峰峰值最大值"),
("ylmddg_ffzmean","顶盖下压力脉动_峰峰值均值"),
("ylmddg_xfs","顶盖下压力脉动_倍频值"),
("ylmddg_xf1","顶盖下压力脉动_一倍频"),
("ylmddg_xf2","顶盖下压力脉动_二倍频"),
("ylmdwy_ffzs","无叶区压力脉动_峰峰值"),
("ylmdwy_ffzmin","无叶区压力脉动_峰峰值最小值"),
("ylmdwy_ffzmax","无叶区压力脉动_峰峰值最大值"),
("ylmdwy_ffzmean","无叶区压力脉动_峰峰值均值"),
("ylmdwy_xfs","无叶区压力脉动_倍频值"),
("ylmdwy_xf1","无叶区压力脉动_一倍频"),
("ylmdwy_xf2","无叶区压力脉动_二倍频"),
("ylmdwk_ffzs","蜗壳进口压力脉动_峰峰值"),
("ylmdwk_ffzmin","蜗壳进口压力脉动_峰峰值最小值"),
("ylmdwk_ffzmax","蜗壳进口压力脉动_峰峰值最大值"),
("ylmdwk_ffzmean","蜗壳进口压力脉动_峰峰值均值"),
("ylmdwk_xfs","蜗壳进口压力脉动_倍频值"),
("ylmdwk_xf1","蜗壳进口压力脉动_一倍频"),
("ylmdwk_xf2","蜗壳进口压力脉动_二倍频"),
("ylmdshang_ffzs","尾水管上游侧压力脉动_峰峰值"),
("ylmdshang_ffzmin","尾水管上游侧压力脉动_峰峰值最小值"),
("ylmdshang_ffzmax","尾水管上游侧压力脉动_峰峰值最大值"),
("ylmdshang_ffzmean","尾水管上游侧压力脉动_峰峰值均值"),
("ylmdshang_xfs","尾水管上游侧压力脉动_倍频值"),
("ylmdshang_xf1","尾水管上游侧压力脉动_一倍频"),
("ylmdshang_xf2","尾水管上游侧压力脉动_二倍频"),
("ylmdxia_ffzs","尾水管下游侧压力脉动_峰峰值"),
("ylmdxia_ffzmin","尾水管下游侧压力脉动_峰峰值最小值"),
("ylmdxia_ffzmax","尾水管下游侧压力脉动_峰峰值最大值"),
("ylmdxia_ffzmean","尾水管下游侧压力脉动_峰峰值均值"),
("ylmdxia_xfs","尾水管下游侧压力脉动_倍频值"),
("ylmdxia_xf1","尾水管下游侧压力脉动_一倍频"),
("ylmdxia_xf2","尾水管下游侧压力脉动_二倍频"),
("wkyc_mvs","蜗壳压差_平均值"),
("wkyc_mvmin","蜗壳压差_平均值最小值"),
("wkyc_mvmax","蜗壳压差_平均值最大值"),
("wkyc_mvmean","蜗壳压差_平均值均值"),
("bqfs_mvs","补气风速_平均值"),
("bqfs_mvmin","补气风速_平均值最小值"),
("bqfs_mvmax","补气风速_平均值最大值"),
("bqfs_mvmean","补气风速_平均值均值"),
("active_power_mvs","有功功率_平均值"),
("active_power_mvmin","有功功率_平均值最小值"),
("active_power_mvmax","有功功率_平均值最大值"),
("active_power_mvmean","有功功率_平均值均值"),
("reactive_power_mvs","无功功率_平均值"),
("reactive_power_mvmin","无功功率_平均值最小值"),
("reactive_power_mvmax","无功功率_平均值最大值"),
("reactive_power_mvmean","无功功率_平均值均值"),
("vane_open_mvs","导叶开度_平均值"),
("vane_open_mvmin","导叶开度_平均值最小值"),
("vane_open_mvmax","导叶开度_平均值最大值"),
("vane_open_mvmean","导叶开度_平均值均值"),
("backup_mvs","备用_平均值"),
("backup_mvmin","备用_平均值最小值"),
("backup_mvmax","备用_平均值最大值"),
("backup_mvmean","备用_平均值均值"),
("waterhead_mvs","静水头_平均值"),
("waterhead_mvmin","静水头_平均值最小值"),
("waterhead_mvmax","静水头_平均值最大值"),
("waterhead_mvmean","静水头_平均值均值"),
("exc_current_mvs","励磁电流_平均值"),
("exc_current_mvmin","励磁电流_平均值最小值"),
("exc_current_mvmax","励磁电流_平均值最大值"),
("exc_current_mvmean","励磁电流_平均值均值"),
("exc_voltage_mvs","励磁电压_平均值"),
("exc_voltage_mvmin","励磁电压_平均值最小值"),
("exc_voltage_mvmax","励磁电压_平均值最大值"),
("exc_voltage_mvmean","励磁电压_平均值均值"),
("zs_mvs","转速_平均值"),
("zs_mvmin","转速_平均值最小值"),
("zs_mvmax","转速_平均值最大值"),
("zs_mvmean","转速_平均值均值"),
("flow_mvs","蜗壳差压流量_平均值"),
("flow_mvmin","蜗壳差压流量_平均值最小值"),
("flow_mvmax","蜗壳差压流量_平均值最大值"),
("flow_mvmean","蜗壳差压流量_平均值均值");


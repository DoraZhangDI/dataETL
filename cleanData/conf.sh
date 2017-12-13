# cmd
HIVE=/usr/bin/hive

# env
export JAVA_HOME=/usr/java/latest/
export PATH=$JAVA_HOME/bin:$PATH

export HADOOP_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
#export HADOOP_MAPRED_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hadoop-mapreduce
export HADOOP_MAPRED_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hadoop-0.20-mapreduce
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hadoop-hdfs
export YARN_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hadoop-yarn
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

export HBASE_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hbase
export PATH=$PATH:$HBASE_HOME/bin

export HIVE_HOME=/opt/cloudera/parcels/CDH-5.11.0-1.cdh5.11.0.p0.34/lib/hive
export PATH=$PATH:$HIVE_HOME/bin

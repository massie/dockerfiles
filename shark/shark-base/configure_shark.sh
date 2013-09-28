#!/bin/bash

function configure_shark() {
	cd /opt/shark-$SHARK_VERSION
	cat > conf/shark-env.sh  <<EOF
#!/usr/bin/env bash
export SCALA_HOME=/opt/scala-2.9.3
export SPARK_HOME=$SPARK_HOME
export SPARK_MEM=512m
export SHARK_MASTER_MEM=512m
export HIVE_HOME="/opt/hive-0.9.0-bin"
export HADOOP_HOME="/etc/hadoop"
export SPARK_HOME="$SPARK_HOME"
export MASTER="spark://$1:7077"
SPARK_JAVA_OPTS="-Dspark.local.dir=/tmp/spark "
SPARK_JAVA_OPTS+="-Dspark.kryoserializer.buffer.mb=10 "
SPARK_JAVA_OPTS+="-verbose:gc -XX:-PrintGCDetails -XX:+PrintGCTimeStamps "
export SPARK_JAVA_OPTS
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
EOF
	cd /opt/hive-0.9.0-bin
	cat > conf/hive-site.xml  <<EOF
<configuration>
<property>
<name>fs.default.name</name>
<value>hdfs://$1:9000/</value>
</property>
<property>  
<name>fs.defaultFS</name>
<value>hdfs://$1:9000/</value>
</property>
<property>
<name>mapred.job.tracker</name>
<value>NONE</value>
</property>
<property>
  <name>hive.exec.scratchdir</name>
  <value>/tmp/hive-scratch</value>
  <description>Scratch space for Hive jobs</description>
</property>
<property>
  <name>hive.metastore.local</name>
  <value>true</value>
</property>
<property>
  <name>javax.jdo.option.ConnectionURL</name>
  <value>jdbc:derby:;databaseName=metastore_db;create=true</value>
</property>
<property>
  <name>javax.jdo.option.ConnectionDriverName</name>
  <value>org.apache.derby.jdbc.EmbeddedDriver</value>
</property>
<property>
  <name>hive.metastore.metadb.dir</name>
  <value>file:///opt/metastore/metadb/</value>
</property>
<property>
  <name>hive.metastore.uris</name>
  <value>file:///opt/metastore/metadb/</value>
</property>
<property>
  <name>hive.metastore.warehouse.dir</name>
  <value>hdfs://$1:9000/user/hdfs/warehouse</value>
</property>
</configuration>
EOF
}
configure_shark $1
mkdir /opt/metastore
chown hdfs.hdfs /opt/metastore
mkdir /opt/spark-0.7.3/work
chown hdfs.hdfs /opt/spark-0.7.3/work
cd /root

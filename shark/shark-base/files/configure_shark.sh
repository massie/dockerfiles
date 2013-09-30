#!/bin/bash

hadoop_files=( "/root/hadoop_files/core-site.xml"  "/root/hadoop_files/hdfs-site.xml" )
shark_files=( "/root/shark_files/shark-env.sh" )
hive_files=( "/root/shark_files/hive-site.xml" "/etc/hadoop/core-site.xml" )

function create_directories() {
    mkdir /opt/metastore
    chown hdfs.hdfs /opt/metastore
    mkdir /opt/spark-$SPARK_VERSION/work
    chown hdfs.hdfs /opt/spark-$SPARK_VERSION/work
}

function deploy_files() {
    for i in "${hadoop_files[@]}";
    do
        filename=$(basename $i);
        cp $i /etc/hadoop/$filename;
    done
    for i in "${hive_files[@]}";
    do
        filename=$(basename $i);
        cp $i /opt/hive-${HIVE_VERSION}-bin/conf/$filename;
    done
    for i in "${shark_files[@]}";
    do
	filename=$(basename $i);
	cp $i /opt/shark-${SHARK_VERSION}/conf/$filename;
    done	
}		

function configure_shark() {
    # Shark
    sed -i s/__MASTER__/$1/ /opt/shark-$SHARK_VERSION/conf/shark-env.sh
    sed -i s/__SPARK_HOME__/"\/opt\/spark-${SPARK_VERSION}"/ /opt/shark-$SHARK_VERSION/conf/shark-env.sh
    sed -i s/__HIVE_HOME__/"\/opt\/hive-${HIVE_VERSION}-bin"/ /opt/shark-$SHARK_VERSION/conf/shark-env.sh
    sed -i s/__JAVA_HOME__/"\/usr\/lib\/jvm\/java-6-openjdk-amd64"/ /opt/shark-$SHARK_VERSION/conf/shark-env.sh
    # Hive
    sed -i s/__MASTER__/$1/ /opt/hive-0.9.0-bin/conf/hive-site.xml
    # Hadoop
    sed -i s/__MASTER__/$1/ /etc/hadoop/core-site.xml
    sed -i s/"JAVA_HOME=\/usr\/lib\/jvm\/java-6-sun"/"JAVA_HOME=\/usr\/lib\/jvm\/java-6-openjdk-amd64"/ /etc/hadoop/hadoop-env.sh
}
deploy_files
configure_shark $1
create_directories


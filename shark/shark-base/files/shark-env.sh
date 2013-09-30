#!/usr/bin/env bash
export SCALA_HOME=/opt/scala-2.9.3
export SPARK_HOME=__SPARK_HOME__
export SPARK_MEM=512m
export SHARK_MASTER_MEM=512m
export HIVE_HOME=__HIVE_HOME__
export HADOOP_HOME="/etc/hadoop"
export MASTER="spark://__MASTER__:7077"
SPARK_JAVA_OPTS="-Dspark.local.dir=/tmp/spark "
SPARK_JAVA_OPTS+="-Dspark.kryoserializer.buffer.mb=10 "
SPARK_JAVA_OPTS+="-verbose:gc -XX:-PrintGCDetails -XX:+PrintGCTimeStamps "
export SPARK_JAVA_OPTS
export JAVA_HOME=__JAVA_HOME__

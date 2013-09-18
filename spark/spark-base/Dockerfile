# Spark 0.7.3
# Version 0.7.3
#
# Use CDH4 4.4.0 as a base
FROM zenfractal/centos-cdh4-hdfs:4.4.0

MAINTAINER Matt Massie massie@cs.berkeley.edu

ENV SCALA_VERSION 2.9.3
ENV SPARK_VERSION 0.7.3
ENV CDH_VERSION cdh4
ENV SCALA_HOME /opt/scala-$SCALA_VERSION
ENV SPARK_HOME /opt/spark-$SPARK_VERSION
ENV PATH $SPARK_HOME:$SCALA_HOME/bin:$PATH

# Install Scala
ADD http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz /
RUN (cd / && gunzip < scala-$SCALA_VERSION.tgz)|(cd /opt && tar -xvf -)
RUN rm /scala-$SCALA_VERSION.tgz

# Install Spark 
ADD http://spark-project.org/download/spark-$SPARK_VERSION-prebuilt-$CDH_VERSION.tgz /
RUN (cd / && gunzip < spark-$SPARK_VERSION-prebuilt-$CDH_VERSION.tgz)|(cd /opt && tar -xvf -)
RUN rm /spark-$SPARK_VERSION-prebuilt-$CDH_VERSION.tgz

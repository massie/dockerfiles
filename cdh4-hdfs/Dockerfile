# Base CentOS image with the Cloudera namenode and datanode packages
#
FROM centos
MAINTAINER Matt Massie massie@cs.berkeley.edu

# Add the CDH4 repository
ADD cloudera-cdh4.repo /etc/yum.repos.d/

# Upgrade the images packages
RUN yum upgrade -y

# Install CDH4 hdfs
RUN yum install -y hadoop-hdfs-namenode hadoop-hdfs-datanode 

# Install Java
RUN yum install -y java-1.7.0-openjdk

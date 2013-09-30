# Base CentOS image with the Cloudera namenode and datanode packages
#
FROM ubuntu:precise
MAINTAINER Matt Massie massie@cs.berkeley.edu

# Upgrade packages
RUN apt-get update
RUN apt-get upgrade -y

# Install Hadoop
ADD http://apache.petsads.us/hadoop/common/stable/hadoop_1.2.1-1_x86_64.deb /root/
RUN dpkg -i /root/hadoop_1.2.1-1_x86_64.deb
RUN rm /root/hadoop_1.2.1-1_x86_64.deb

# install a few other useful packages
RUN apt-get install -y less net-tools vim-tiny sudo

# add Hadoop config file templates
# NOTE: we rather do this as a single ADD statement
# since we are running into
#       Error build: Unable to mount using aufs
#       Unable to mount using aufs
# issue. For more information see
#       https://github.com/dotcloud/docker/issues/1171
ADD files /root/hadoop_files

# Install Java
RUN apt-get install -y openjdk-6-jdk
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

# Spark 0.7.3
# Version 0.7.3
#
# Use CDH4 4.4.0 as a base
FROM spark-base:0.7.3
MAINTAINER Matt Massie massie@cs.berkeley.edu

# Setup a volume for data
VOLUME ["/data"]

ENV SHARK_VERSION 0.7.0

# Install Shark
ADD http://spark-project.org/download/shark-${SHARK_VERSION}-hadoop1-bin.tgz /
RUN (cd / && gunzip < shark-${SHARK_VERSION}-hadoop1-bin.tgz)|(cd /opt && tar -xvf -)
RUN rm /shark-${SHARK_VERSION}-hadoop1-bin.tgz

# Configure Shark
ADD configure_shark.sh /opt/

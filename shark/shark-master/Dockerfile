# Spark
FROM shark-base:0.7.0
MAINTAINER Matt Massie massie@berkeley.edu

# Setup a volume for data
VOLUME ["/data"]

# Note: we assume the virtual bridge is used!

RUN cp /etc/hadoop/core-site.xml /opt/hive-0.9.0-bin/conf/core-site.xml

# Add run script
ADD run_shark_master.sh /opt/

# Add default command for master
ADD default_cmd /root/
CMD ["/root/default_cmd"]


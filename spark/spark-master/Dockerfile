# Spark
FROM zenfractal/spark-base:0.7.3
MAINTAINER Matt Massie massie@berkeley.edu

# Setup a volume for data
VOLUME ["/data"]

# Expose TCP ports 7077 8080
EXPOSE 7077 8080

ADD default_cmd /root/
CMD ["/root/default_cmd"]

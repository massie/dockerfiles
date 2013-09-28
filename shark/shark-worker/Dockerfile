# Spark
FROM shark-base:0.7.0
MAINTAINER Matt Massie massie@berkeley.edu

# Setup a volume for data
VOLUME ["/data"]

# Instead of using a random port, bind the worker to a specific port
# Note: Here we assume the virtual bridge is used!
ENV SPARK_WORKER_PORT 8888
#EXPOSE 8888

# Add run script
ADD run_shark_worker.sh /opt/

# Add the entrypoint script for the worker
ADD default_cmd /root/
ENTRYPOINT ["/root/default_cmd"]

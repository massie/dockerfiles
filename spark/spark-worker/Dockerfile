# Spark
FROM zenfractal/spark-base:0.7.3
MAINTAINER Matt Massie massie@berkeley.edu

# Setup a volume for data
VOLUME ["/data"]

# Instead of using a random port, bind the worker to a specific port
ENV SPARK_WORKER_PORT 8888
EXPOSE 8888

# Add the entrypoint script for the master
CMD ["-h"]
ENTRYPOINT ["/opt/spark-0.7.3/run", "spark.deploy.worker.Worker"]

#!/bin/bash -e

echo "Starting Apache Spark..."

# Check if Spark Master is running
#
if ! ps -ef | grep -q "org.apache.spark.deploy.master.Master"; then
    echo "Spark is not running. Starting..."
    sudo /opt/spark/sbin/start-master.sh
    if ! ps -ef | grep -q "org.apache.spark.deploy.worker.Worker"; then
        echo "Spark Worker is not running. Starting..."
        sudo /opt/spark/sbin/start-worker.sh spark://$(hostname):7077
    else
        echo "Spark Worker already running"
    fi
else
    echo "Spark Master already running"
fi

echo
echo "----------------------------------"
echo "Master UI:  http://localhost:8080"
echo "Workers UI: http://localhost:8081"
echo "----------------------------------"
echo
echo "Post-Attach Commands Complete!"
echo
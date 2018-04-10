#!/bin/bash
CASSANDRA_HOME="apache-cassandra-3.11.2"
CASSANDRA_HOST="127.0.0.1"
CASSANDRA_PORT="native=9042"

echo "--------------------------------------------------------------------"
echo "CASSANDRA_HOME: $CASSANDRA_HOME"
echo "CASSANDRA_HOST: $CASSANDRA_HOST"
echo "CASSANDRA_PORT: $CASSANDRA_PORT"
echo "--------------------------------------------------------------------"

PARAMS="user profile=stresstest-axes.yaml ops(insert=1000) n=1000000 no-warmup -rate threads=400"

echo "--------------------------------------------------------------------"
echo start stresstest with parameters "$PARAMS"
echo

$CASSANDRA_HOME/tools/bin/cassandra-stress $PARAMS -node $CASSANDRA_HOST -port $CASSANDRA_PORT -log file=stresstest-axes.log

echo
echo "--------------------------------------------------------------------"
echo finished stresstest
echo "--------------------------------------------------------------------"

#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}
: ${ZOO_HOME:=/usr/local/zookeeper}
: ${HBASE_HOME:=/usr/local/hbase}

export JAVA_HOME="$JAVA_HOME"
rm /tmp/*.pid


cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp;
curl -LO $cp ; done; cd -

service sshd start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
$ZOO_HOME/bin/zkServer.sh start
$HBASE_HOME/bin/start-hbase.sh


# if [[ $1 == "-bash" ]]; then
#   /bin/bash
# fi
#
#
# if [[ $1 == "-sqlline" ]]; then
#     /usr/local/phoenix/hadoop2/bin/sqlline.py localhost
# fi

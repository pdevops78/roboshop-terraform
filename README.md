# roboshop-terraform


rabbitmq:
========

rds for mysql
docdb for mongodb
elasticache for redis
rabbitmq ---> normal ec2





docdb:
------
"mongodb://docdb:roboshop123@docdb-cluster-dev.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false"

DOCUMENTDB == 'true'
mongodb://docdb:roboshop123@mongodb:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false

Download the Amazon DocumentDB Certificate Authority (CA) certificate required to authenticate to your cluster
==============================================================================================================
wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

Connect to this cluster with the mongo shell
==============================================
mongosh docdb-cluster-dev.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username docdb --password <insertYourPassword>

Connect to this cluster with an application
============================================
mongodb://docdb:<insertYourPassword>@docdb-cluster-dev.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false


redis:  redis-dev.orvmwx.0001.use1.cache.amazonaws.com:6379
rds: mysql-dev.cvkemucwmc9p.us-east-1.rds.amazonaws.com

redis-dev.orvmwx.0001.use1.cache.amazonaws.com:6379
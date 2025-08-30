# roboshop-terraform


rabbitmq:
========

rds for mysql
docdb for mongodb
elasticache for redis
rabbitmq ---> normal ec2





docdb:
------
Download the Amazon DocumentDB Certificate Authority (CA) certificate required to authenticate to your cluster
==============================================================================================================
wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

Connect to this cluster with the mongo shell
==============================================
mongosh docdb-cluster-dev.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017 --tls --tlsCAFile global-bundle.pem --retryWrites=false --username docdb --password <insertYourPassword>

Connect to this cluster with an application
============================================
mongodb://docdb:<insertYourPassword>@docdb-cluster-dev.cluster-cvkemucwmc9p.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false


redis:  arn:aws:elasticache:us-east-1:041445559784:cluster:redis-dev
rds: mysql-dev.cvkemucwmc9p.us-east-1.rds.amazonaws.com
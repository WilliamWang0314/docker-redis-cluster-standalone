#!/bin/bash
###############################################
#auth:2623047617@qq.com
#Description: This script is used to add passwords to redis-cluster
#Usage: sh add_redis_cluster_passwd.sh mypasswd

#################################################
mypasswd=$(mkpasswd -s 0)

for dd in {7001..7006} 
do 
	/usr/local/bin/redis-cli -h 127.0.0.1 -p $dd config set masterauth "$mypasswd"    
done 



for dd in {7001..7006} 
do
	/usr/local/bin/redis-cli -h 127.0.0.1 -p $dd config set requirepass "$mypasswd"  
done 


for dd in {7001..7006}  
do 
	/usr/local/bin/redis-cli -h 127.0.0.1 -p $dd -a "$mypasswd"   config rewrite  
done  


echo "Warm reminder: redis-cluster password has been modified successfully, password:$mypasswd"

echo "Execute the following command to see the redis-cluster password: find /data/nosql/ -type f -name \"*.conf\"|xargs grep requirepass"


#!/bin/bash

for dd in {7001..7006} 
do 
	/usr/local/bin/redis-cli -h 127.0.0.1 -p $dd config set masterauth "$1"    
done 



for dd in {7001..7006} 
do
	/usr/local/bin/redis-cli -h 127.0.0.1 -p $dd config set requirepass "$1"  
done 


for dd in {7001..7006}  
do 
	/usr/local/bin/redis-cli -h 192.168.5.15 -p $dd -a "$1"   config rewrite  
done  


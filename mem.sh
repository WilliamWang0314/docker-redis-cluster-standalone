#!/bin/bash
/usr/local/bin/redis-server /data/nosql/redis_7005/redis_7005.conf
/usr/local/bin/redis-server /data/nosql/redis_7004/redis_7004.conf
/usr/local/bin/redis-server /data/nosql/redis_7006/redis_7006.conf
/usr/local/bin/redis-server /data/nosql/redis_7001/redis_7001.conf
/usr/local/bin/redis-server /data/nosql/redis_7002/redis_7002.conf
/usr/local/bin/redis-server /data/nosql/redis_7003/redis_7003.conf
tail -f /data/nosql/redis_7001/redis.log

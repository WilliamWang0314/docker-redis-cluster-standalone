# docker-redis-cluster-standalone
#部署3个项目的redis-cluster
[root@192-168-5-36 ~]# docker run -d --name  project1-redis-cluster -p 7001-7006:7001-7006/tcp tkyw/redis-cluster-standalone
32745a606a6d2c512400a3d31de9f704a9f48dcbe01f87bee709e94c806921a6
[root@192-168-5-36 ~]# docker run -d --name  project2-redis-cluster -p 8001-8006:7001-7006/tcp tkyw/redis-cluster-standalone
b07bf7bc64b4f66df139ae678ebf3b896b85eb428b1c118a0243a52d295d0d86
[root@192-168-5-36 ~]# docker run -d --name  project3-redis-cluster -p 9001-9006:7001-7006/tcp tkyw/redis-cluster-standalone
9c8e6ed426e01d8051e7ddc3aa23d86c0f3648b10e65290c439e16ab0f06bc28

#增加redis-cluster 认证密码，如果不需要密码，跳过此步骤
[root@192-168-5-36 ~]# docker exec -it project1-redis-cluster /bin/bash
[root@32745a606a6d /]# sh add_redis_cluster_passwd.sh 
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
OK
Warm reminder: redis-cluster password has been modified successfully, password:5NjeXqq9q
Execute the following command to see the redis-cluster password: find /data/nosql/ -type f -name "*.conf"|xargs grep requirepass


#验证redis-cluster 密码是否加载成功 
[root@192-168-5-40 ~]# /usr/local/bin/redis-cli -h 192.168.5.36 -p 7001 -a 5NjeXqq9q   info memory
# Memory
used_memory:2627656
used_memory_human:2.51M
used_memory_rss:10096640
used_memory_rss_human:9.63M
used_memory_peak:2627656
used_memory_peak_human:2.51M
used_memory_peak_perc:100.76%
used_memory_overhead:2552472
used_memory_startup:1437408
used_memory_dataset:75184
used_memory_dataset_perc:6.32%
total_system_memory:8184160256
total_system_memory_human:7.62G
used_memory_lua:37888
used_memory_lua_human:37.00K
maxmemory:0
maxmemory_human:0B
maxmemory_policy:noeviction
mem_fragmentation_ratio:3.84
mem_allocator:jemalloc-4.0.3
active_defrag_running:0
lazyfree_pending_objects:0

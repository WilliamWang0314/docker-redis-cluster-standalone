#!/bin/bash

rm -f /etc/yum.repos.d/*

curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/CentOS7-Base-163.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all 
yum makecache fast
yum -y install vim net-tools iproute 
yum -y install gcc gcc-c++ autoconf automake pcre pcre-devel openssl openssl-devel zlib zlib-devel wget vim
mkdir -p /data
mkdir -p /export/scripts/

echo export PATH=\$PATH:/usr/local/ruby2.6.2/bin/ >>/etc/profile

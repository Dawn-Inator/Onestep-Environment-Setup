#!/bin/bash

# 安装必要的依赖包
yum -y install gcc make readline-devel sqlite-devel openssl openssl-devel libffi-devel zlib*

# 下载 Python 源码包
wget http://python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz

# 解压源码包
tar xf Python-3.7.4.tar.xz

# 进入源码目录
cd Python-3.7.4/

# 配置安装选项，指定安装目录
./configure --prefix=/usr/local/python-3.7

# 编译并安装 Python
make && make install

# 删除系统默认的 python3 和 pip3
rm -rf /usr/bin/python3
rm -rf /usr/bin/pip3

# 创建新的符号链接
ln -s /usr/local/python-3.7/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python-3.7/bin/pip3.7 /usr/bin/pip3
ln -s /usr/local/python-3.7/bin/pip3.7 /usr/bin/pip

# 清理安装包和中间产物
cd ..
rm -rf Python-3.7.4*
rm -rf Python-3.7.4

echo "Python 3.7.4 installation is complete."

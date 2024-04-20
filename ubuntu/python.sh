#!/bin/bash

# 更新包索引
apt-get update

# 安装必要的依赖包
apt-get install -y gcc make libreadline-dev libsqlite3-dev libssl-dev libffi-dev zlib1g-dev

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

# 更新替代版本
update-alternatives --install /usr/bin/python3 python3 /usr/local/python-3.7/bin/python3.7 1
update-alternatives --install /usr/bin/pip pip /usr/local/python-3.7/bin/pip3.7 1

# 清理安装包和中间产物
cd ..
rm -rf Python-3.7.4.tar.xz Python-3.7.4

echo "Python 3.7.4 installation is complete."

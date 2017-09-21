#!/bin/bash

cd /tmp/
# install curl from source with openssl support
sudo yum install openssl openssl-devel -y
sudo yum groupinstall "Development Tools" -y
curl -sSL -o curl-7.55.1.tar.gz https://curl.haxx.se/download/curl-7.55.1.tar.gz
tar -zxvf curl-7.55.1.tar.gz
cd curl-7.55.1
./configure --with-ssl=/usr/bin
make
sudo make install

# update path for curl 
sudo chmod 775 /etc/ld.so.conf.d
sudo tee /etc/ld.so.conf.d/libcurl.conf << 'EOF'
/usr/local/lib
EOF
sudo chmod 755 /etc/ld.so.conf.d
sudo ldconfig

# install .net
cd /tmp/
sudo yum install libunwind libicu -y
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?LinkID=835019
sudo mkdir -p /opt/dotnet
sudo tar zxf dotnet.tar.gz -C /opt/dotnet
sudo ln -s /opt/dotnet/dotnet /usr/local/bin

# install powershell alpha
yum -y install https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm


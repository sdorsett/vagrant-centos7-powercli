#!/bin/bash

# install powercli
cd /tmp/
curl -sSL -o PowerCLI_Core.zip https://download3.vmware.com/software/vmw-tools/powerclicore/PowerCLI_Core.zip
yum -y install unzip
mkdir -p ~/.local/share/powershell/Modules
unzip PowerCLI_Core.zip && unzip 'PowerCLI.*.zip' -d ~/.local/share/powershell/Modules

sudo ldconfig

# create powershell script to disable certificate validation and run it
sudo tee ~/set-powercli-config.ps1 << 'EOF'
Get-Module -ListAvailable PowerCLI* | Import-Module
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false
EOF
powershell -f ~/set-powercli-config.ps1



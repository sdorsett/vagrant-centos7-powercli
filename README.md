This repository provides a Vagrantfile and supporting scripts to deploy a CentOS 7 vm to vSphere and then install VMware powercli core on it.

In order to use this repository you need the following:
* Install vagrant from [this link](https://www.vagrantup.com/downloads.html)
* Install the vagrant-vcenter plugin by running the following command:
```
  vagrant plugin install vagrant-vcenter
```
* Clone down this repository using the following command:
```
  git clone https://github.com/sdorsett/vagrant-centos7-powercli.git
``` 
* Update `Vagrantfile` to reflect the correct values for your vSphere environment:
```
      vcenter.hostname                - vSphere FQDN or IP address
      vcenter.username                - username used to connect to vSphere
      vcenter.password                - password used to connect to vSphere
      vcenter.folder_name             - VM folder the vagrant virtual machine will be deployed to
      vcenter.datacenter_name         - name of the datacenter to deploy the vagrant virtual machine to
      vcenter.computer_name           - name of the cluster to deploy the vagrant virtual machine to
      vcenter.datastore_name          - datastore to deploy vagrant template and virtual machine to
      vcenter.template_folder_name    - VM folder the vagrant template will be deployed to
      vcenter.network_name            - standard or dv portgroup that the vagrant vitual machine will be connected to
      vcenter.linked_clones           - deploy virtual machine as a linked clone of template
      vcenter.enable_vm_customization - true or false as to performing guest customization on the vagrant virtual machine
      vcenter.num_cpu                 - number of virtual CPU to be given to the vagrant virtual machine
      vcenter.memory                  - amount of memory ( in MB ) to be given to the vagrant virtual machine
``` 
* Run `vagrant up` to deploy the virtual machine
 

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :'centos7-powercli' do |m|
    m.vm.box = 'standorsett/centos-7'
    m.vm.box_version = "1707.01"
    m.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z", "--links"]

    m.vm.hostname = 'centos7-powercli'
    m.vm.provider :vcenter do |vcenter|
      vcenter.hostname = '192.168.1.51'
      vcenter.username = 'administrator@vsphere.local'
      vcenter.password = 'VMware123!'
      vcenter.folder_name = 'Vagrant/Deployed'
      vcenter.datacenter_name = 'datacenter'
      vcenter.computer_name = 'cluster'
      vcenter.datastore_name = 'local-datastore'
      vcenter.template_folder_name = 'Vagrant/Templates'
      vcenter.network_name = 'VM Network'
      vcenter.linked_clones = true
      vcenter.enable_vm_customization = true
      vcenter.num_cpu = 2
      vcenter.memory = 4096
    end

    m.nfs.functional = false
  end

  config.vm.provision :shell do |shell|
    shell.path = "install-powercli-dependencies.sh"
  end

  config.vm.provision :shell do |shell|
    shell.path = "install-powercli.sh"
    shell.privileged = false
  end

end

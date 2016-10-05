# -*- mode: ruby -*-
# vi: set ft=ruby :

env = 'dev'

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-6.6-64-puppet-enterprise"
  config.vm.box_version = "1.0.1"

  config.ssh.insert_key = false

  config.vm.network :private_network, ip: "192.168.10.100"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512" # MB
  end

  # Install Puppet
  config.vm.provision :shell, :path => "centos-6-x.sh"

  # Alter shared folder to sync to expected Puppet folder
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/etc/puppetlabs/code/environments/#{env}"

  # Clear firewall rules to allow intermachine communication
  config.vm.provision "shell", inline: "iptables -F", run: "once"

  # Puppet Provisioning
  config.vm.provision "puppet" do |puppet|
    puppet.options = "--environment=#{env}"

    puppet.manifests_path = "manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "modules"

    # Hiera config
    puppet.hiera_config_path = "hiera/hiera.yaml"
  end
end
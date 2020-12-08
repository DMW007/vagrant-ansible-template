# -*- mode: ruby -*-
# vi: set ft=ruby :

$name = 'vagrant-template'
$box = 'ubuntu/focal64'
$memory = 1024
$cpu_cores = 2

Vagrant.configure("2") do |config|
  config.vm.box = $box
  
  config.vm.define $name
  config.vm.hostname = $name
  
  config.vm.provider :virtualbox do |vm|
    vm.name = $name
  	vm.memory = $memory
	  vm.cpus = $cpu_cores
  end
  
  config.vm.provision "shell", inline: <<-'SHELL'
    apt-get update && apt-get upgrade -y
  SHELL

  config.vm.network "forwarded_port", guest: 80, host: 8081
  #config.vm.network "private_network", ip: "192.168.60.2"

  #config.vm.synced_folder 'html', '/var/www/html/'
end

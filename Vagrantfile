# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"
$config_file = 'vars.yml'
if !File.file?($config_file)
  raise "Vars file " + $config_file + " not found!"
end
$cfg = YAML.load_file($config_file)

Vagrant.configure("2") do |config|
  config.vm.box = $cfg['box']
  
  config.vm.define $cfg['name']
  config.vm.hostname = $cfg['name']
  
  config.vm.provider :virtualbox do |vm|
    vm.name = $cfg['name']
  	vm.memory = $cfg['memory']
	  vm.cpus = $cfg['cpu_cores']
  end

  #config.vm.network "forwarded_port", guest: 80, host: 8081
  #config.vm.network "private_network", ip: "192.168.60.2"

  #config.vm.synced_folder 'html', '/var/www/html/'
  
  config.vm.provision "shell", inline: <<-'SHELL'
    apt-get update && apt-get upgrade -y
  SHELL

  if $cfg.include? 'proxy_enabled' && $cfg['proxy_enabled'] then
    config.vm.provision "shell", args: [$cfg['proxy_cert_host']], inline: <<-SHELL
      echo -n | openssl s_client -connect $1 -showcerts | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/ca-trust/source/anchors/custom-ca.crt
      update-ca-trust
    SHELL
  end

  puts "Installing tools"
  config.vm.provision "shell", inline: <<-SHELL
    tee -a ~/.bashrc > /dev/null <<EOT
      alias l='ls -lh'
      alias ll='ls -lha'
    EOT
    yum install -y git vim htop
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
  SHELL

end

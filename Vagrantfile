# -*- mode: ruby -*-
# vi: set ft=ruby :

require "yaml"
$config_file = ENV['VARS_FILE'] || 'vars.yml'
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
  
  if ($cfg.include? 'proxy_enabled') && ($cfg['proxy_enabled']) then
    config.vm.provision "shell", args: [$cfg['proxy_cert_host']], inline: <<-SHELL
      echo -n | openssl s_client -connect $1 -showcerts | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/ca-trust/source/anchors/custom-ca.crt
      update-ca-trust
    SHELL
  end

  config.vm.provision "shell", path: "scripts/init.sh"
  config.vm.provision "shell", path: "scripts/init-nonroot.sh", privileged: false

  if ($cfg.include? 'ansible') && ($cfg['ansible']['enabled'])
    $ansible_cfg = $cfg['ansible']
    config.vm.provision "ansible" do |ansible|  
      ansible.verbose = $ansible_cfg['verbose_level']
      ansible.playbook = $ansible_cfg['playbook']
      $vars_file = ENV['ANSIBLE_VARS_FILE'] || $config_file
      ansible.extra_vars = "@" + $vars_file
    end
  end
end

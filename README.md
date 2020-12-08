# Vagrant + Ansible Template
This template is designed as base for new Vagrant projects. It contains commonly used features like

- Usefull tools (htop, fzf)
- Support for variables in an external yaml file
- Setting ressource consumption using the var file
- Adding certificates for MITM proxys in coporate environments
- Provision the VM using Ansible (which is a good extension to Vagrant)

It's mainly based on the following larger Vagrant files, which I made for other projects:
- https://github.com/DMW007/centos-dev-on-vagrant-with-proxy/blob/master/Vagrantfile
- https://github.com/DMW007/k8s-with-vagrant-ansible-rancher/blob/master/Vagrantfile

## Requirements
You need to install the following dependencies:
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Hypervisor - VirtualBox is recommended as free and open solution](https://www.virtualbox.org/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

Additionally, you need to enable the virtualization features in the bios/uefi to allow VirtualBox the execution of VMs. Depending on the software you want to deploy, keep in mind that the machine need to have enough ressources. Mostly RAM is important. At least 8GB, the more the better.

## Getting started
1. Clone this project: `git clone https://github.com/DMW007/vagrant-ansible-template.git`
2. Customize it to fit your needs like creating additional provision scripts, add Ansible playbooks and other things you need
3. To create and provision the machine, execute `vagrant up` in the root dictionary
4. If you want to just re-provision the vm, run `vagrant up --provision`
5. When you need or want to re-create the entire vm from scratch, execute `vagrant destroy; vagrant up`. To skip the confirmation, use `vagrant destroy -f`

## Env variables
- `VARS_FILE` let you specify the yaml file containing all configuration variables. If not set, the default is `vars.yml`.
- `ANSIBLE_VARS_FILE` is the yaml vars file for the Ansible provisioner. If not set, the default is the path to `VARS_FILE` which means you have access to all vars from the Vagrant vars file

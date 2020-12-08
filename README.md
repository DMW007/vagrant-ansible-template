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

## Env variables
- `VARS_FILE` let you specify the yaml file containing all configuration variables. If not set, the default is `vars.yml`.
- `ANSIBLE_VARS_FILE` is the yaml vars file for the Ansible provisioner. If not set, the default is the path to `VARS_FILE` which means you have access to all vars from the Vagrant vars file
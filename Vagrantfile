# YAML lesen
require "yaml"
boxes = YAML.load_file("vagrant_hosts.yml")

# Variablen
IMAGE_NAME = "bento/ubuntu-20.04"
VM_NUM = 1
VM_CPU = 2 
VM_MEM = 2048
VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

Vagrant.configure("2") do |config|
    config.vm.box = IMAGE_NAME

    ANSIBLE_RAW_SSH_ARGS = []
    i = 0

    boxes.each do |box|
        ANSIBLE_RAW_SSH_ARGS << "-o IdentityFile=.vagrant/machines/#{box["hostname"]}/virtualbox/private_key"   
        config.vm.define box["hostname"] do |machine|
            machine.vm.network "private_network", ip: box["ip"]
            machine.vm.hostname = box["hostname"]
            machine.vm.provider "virtualbox" do |v|
                v.name = box["label"]
                v.memory = VM_MEM
                v.cpus = VM_CPU
            end
            i += 1

            if i == boxes.count
                machine.vm.provision :ansible do |ansible|
                    ansible.raw_ssh_args = ANSIBLE_RAW_SSH_ARGS
                    ansible.verbose = "-vvv"
                    ansible.limit = "all"
                    ansible.inventory_path = "provisioning/hosts.yml"
                    ansible.playbook = "provisioning/site.yml"
                end
            end
        end
    end
end
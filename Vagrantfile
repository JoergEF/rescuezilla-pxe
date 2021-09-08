IMAGE_NAME = "bento/ubuntu-20.04"

VM_NAME = "RescueZilla"
VM_NUM = 1
VM_CPU = 2 
VM_MEM = 2048

IP_BASE = "192.168.100."

VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

Vagrant.configure("2") do |config|

    (1..VM_NUM).each do |i|      
        config.vm.define "#{VM_NAME}-#{i}" do |machine|
            machine.vm.box = IMAGE_NAME
            machine.vm.network "private_network", ip: "#{IP_BASE}#{i + 10}"
            machine.vm.hostname = "#{VM_NAME}-#{i}"
            machine.vm.provider "virtualbox" do |v|
                v.name = "#{VM_NAME}-#{i}"
                v.memory = VM_MEM
                v.cpus = VM_CPU
            end
        end
    end
end
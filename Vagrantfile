# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.hostname = 'riemann-berkshelf'
  config.vm.box = 'opscode-centos-6.4'
  config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box'
  config.vm.network :private_network, ip: '172.16.0.4'
  config.vm.provision :shell, :inline => 'which chef-solo; if [[ $? != 0 ]]; then curl -L https://www.opscode.com/chef/install.sh | sudo bash ; fi'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '3000']
    vb.customize ['modifyvm', :id, '--cpus', '4']
  end

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :graphite => {
        :web_server => 'apache'
      }
    }

    chef.run_list = [
      'recipe[riemann::default]'
    ]
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "sstk-wp-dev"
  config.omnibus.chef_version = :latest
  config.vm.box = "chef/centos-6.5"

  # this may need to be changed depending on your environment
  config.vm.network "private_network", ip: "192.168.0.100"
  
  config.berkshelf.enabled = true
  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.berksfile_path = "./Berksfile"

  # this provisioning section can be re-run with 'vagrant provision'
  # any time, and will pull in the cookbooks from the Berksfile again.
  # specifically this is useful for applying the cookbook again after
  # you've made changes on your dev workstation. in other words, do a
  # 'vagrant provision' in the same dir as this Vagrantfile to kick off
  # a chef-solo run in the VM.
  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "data_bags"
    chef.encrypted_data_bag_secret_key_path = "~/encrypted_data_bag_secret"
    chef.run_list = [
      "recipe[sstk-wp::default]"
    ]
  end
end

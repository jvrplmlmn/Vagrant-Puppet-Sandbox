# -*- mode: ruby -*-
# vi: set ft=ruby st=2 ts=2 :

domain = 'domain.edu'

nodes = [
	{:hostname => 'puppet', :ip_address => '10.0.33.10', :box => 'precise32'},
	{:hostname => 'client1', :ip_address => '10.0.33.11', :box => 'precise32'},
	{:hostname => 'client2', :ip_address => '10.0.33.12', :box => 'precise32'},
]

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
	
	nodes.each do |node|
		config.vm.define node[:hostname] do |node_config|
  		# Every Vagrant virtual environment requires a box to build off of.
			node_config.vm.box = node[:box]
  		# The url from where the 'config.vm.box' box will be fetched if it
  		# doesn't already exist on the user's system.
  	  node_config.vm.box_url = 'http://files.vagrantup.com' + node_config.vm.box + '.box'
			node_config.vm.hostname = node[:hostname] + '.' + domain
  		# Create a private network, which allows host-only access to the machine
  		# using a specific IP.
			node_config.vm.network :private_network, ip: node[:ip_address]

			node_config.vm.provision :puppet do |puppet|
				puppet.manifests_path = 'provision/manifests'
				puppet.module_path = 'provision/modules'
			end
		end
	end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network :forwarded_port, guest: 80, host: 8080

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
  	vb.customize ["modifyvm", :id, "--memory", "256"]
  end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "init.pp"
  # end

end

# Class: puppet
#
# This module installes and manages the Puppet client daemon
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample usage:
#
# [Remember: No empty lines between comments and class definition]
class puppet::server {

	package { 'puppetmaster':
		ensure => 'latest'
	}
	
	service { 'puppetmaster':
		enable  => true,
		ensure  => running,
		require => Package['puppetmaster'],
    }

	file { 'puppet.conf':
	  path    => '/etc/puppet/puppet.conf',
	  owner   => 'puppet',
	  group   => 'puppet',
	  mode    => '0644',
	  source  => 'puppet:///modules/puppet/puppet.conf',
	  require => Package['puppetmaster'],
	  notify  => Service['puppetmaster'],
    }

	file { 'site.pp':
  	  path    => '/etc/puppet/manifests/site.pp',
	  owner   => 'puppet',
	  group   => 'puppet',
	  mode    => '0644',
	  source  => 'puppet:///modules/puppet/site.pp',
	  require => Package['puppetmaster'], 
  	}


	file { 'autosign.conf':
	  path    => '/etc/puppet/autosign.conf',
	  owner   => 'puppet',
	  group   => 'puppet',
	  mode    => '0644',
	  content => '*',
	  require => Package['puppetmaster'],
    }
   
   file { '/etc/puppet/manifests/nodes.pp':
     ensure => link,
	 target => '/vagrant/nodes.pp',
	 require => Package['puppetmaster'],
   }
   

}

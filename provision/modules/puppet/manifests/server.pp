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
}

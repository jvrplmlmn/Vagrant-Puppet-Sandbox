# Class: puppet
#
# This module installes and manages the Puppet client daemon
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample usage:
#
# [Remember: No empty lines between comments and class definition]
class puppet {

	package { 'puppet':
		ensure => 'latest'
	}
	
	service { 'puppet':
		enable  => true,
		ensure  => running,
		require => Package['puppet'],
    }
}

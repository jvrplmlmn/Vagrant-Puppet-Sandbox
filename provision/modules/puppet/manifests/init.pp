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

    # WA to start the agent on Ubuntu
    # Read more: http://serverfault.com/a/275059
    exec { 'start_puppet':
      onlyif  => '/usr/bin/test -f /etc/default/puppet',
      command => '/bin/sed -i /etc/default/puppet -e "s/START=no/START=yes/"',
      require => Package['puppet'],
      before  => Service['puppet'],
    }
}

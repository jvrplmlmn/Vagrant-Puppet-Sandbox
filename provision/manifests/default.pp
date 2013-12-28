#
# Defines defaults for Vagrant provisioning
#


#stage { 'pre-production': before => Stage['main']}
stage { 'pre-production': }
stage { 'post-install': }

Stage['pre-production'] -> Stage['main']
Stage['main'] -> Stage['post-install']

class { 'repos': stage => 'pre-production' }
class { 'networking': }
class { 'puppet': }
class { 'motd': stage => 'post-install' }

# Puppetmaster
if $hostname == 'puppet' {
  class { 'puppet::server': }
}

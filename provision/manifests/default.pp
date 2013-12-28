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
class { 'motd': }

# Puppetmaster
if $hostname == 'puppet' {
  class { 'puppet::server': }
}

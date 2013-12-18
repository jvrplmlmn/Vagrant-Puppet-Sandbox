#
# Defines defaults for Vagrant provisioning
#


stage { 'pre-production': before => Stage['main']}
class { 'repos': stage => 'pre-production' }
class { 'networking': }
class { 'puppet': }

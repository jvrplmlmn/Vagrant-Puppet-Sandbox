#
# Defines defaults for Vagrant provisioning
#


stage { 'pre-production': before => Stage['main']}

class { 'repos': stage => 'pre-production' }
class { 'motd': }
class { 'networking': }
class { 'puppet': }

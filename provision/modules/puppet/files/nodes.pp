#
# site.pp - defines all puppet nodes 
#

# Puppetmaster - self-managed
node 'puppet' {}

## Clients
node 'client1' {
  class { 'test': }
node 'client2' {}

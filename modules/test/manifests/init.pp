# == Class: test
#
# This class is written for test purpouses.
# We're checking that the master and the clients are talking to each other.
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
# class { 'test': }
#
class test {

  file { '/tmp/test':
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
    content => "Hello Puppet!\n",
  }

}

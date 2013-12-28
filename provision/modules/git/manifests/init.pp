# == Class: git
#
# This class installs git
#
# === Actions
# - Installs the git package
#
# === Sample Usage
# class { 'git': }
#
class git {
  package { 'git':
    ensure => 'installed',
  }
}

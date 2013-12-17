class networking {
  
  file { '/etc/hosts':
    owner   => 'root',
	group   => 'root',
	mode    => '0644',
	content => template('networking/hosts.erb'),
  }

}

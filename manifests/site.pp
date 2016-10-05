node default {
	file { '/home/text.txt': 
    ensure => present,
    content => 'Hello World'
  }
}
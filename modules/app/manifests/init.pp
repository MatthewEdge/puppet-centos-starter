class app {
    file { ['/opt', '/opt/app', '/opt/app/test']:
        ensure => directory
    }
    ->
    file { '/home/text.txt':
        ensure => present,
        content => template('')
    }
}
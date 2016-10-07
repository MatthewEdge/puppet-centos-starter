# Puppet Enterprise Refresh module
class refresh {
    file { '/home/text.txt':
        ensure  => present,
        content => hiera('text')
    }
}
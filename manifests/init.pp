# Puppet Enterprise Refresh module
class PuppetEnterpriseRefresh {
    file { '/home/text.txt':
        ensure  => present,
        content => hiera('text')
    }
}
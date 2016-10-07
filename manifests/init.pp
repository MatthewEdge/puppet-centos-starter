# Puppet Enterprise Refresh module
class refresh(
    $file_contents = hiera('text')
) {
    file { '/home/text.txt':
        ensure  => present,
        content => $file_contents
    }
}
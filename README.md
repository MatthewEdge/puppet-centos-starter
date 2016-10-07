# puppet-centos-starter

Starter Project for Puppet, Hiera, and RSpec/ServerSpec on a CentOS 6.6 Vagrant box

## RSpec Puppet / ServerSpec

Setup instructions for RSpec Puppet: http://rspec-puppet.com/setup/

Requires a `/spec` folder with {classes, defines, hosts, functions} subfolders. A `site.pp` file MUST be preset in `/spec/fixtures/manifests`

To make Puppet's manifest autoloader work correctly:

    $ mkdir spec/fixtures/modules/<your module name>
    $ cd spec/fixtures/modules/<your module name>
    $ for i in files lib manifests templates; do ln -s ../../../../$i $i; done
    $ cd ../../../../
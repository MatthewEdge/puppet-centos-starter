# puppet-centos-starter

Starter Project for Puppet, Hiera, and RSpec/ServerSpec on a CentOS 6.6 Vagrant box

## Gems

Requires the following gems be installed:

    gem puppet
    gem rspec-puppet
    gem serverspec

## Testing Hiera

A module that relies on Hiera data should include those definitions in its class params:

    class refresh(
        $file_contents = hiera('text')
    ) {
        file { '/home/text.txt':
            ensure  => present,
            content => $file_contents
        }
    }

Thus the spec can look like the following:

    require 'spec_helper'

    describe 'refresh' do
      # ...

      context 'with file_contents => Hi' do
        let(:params) { 
          { :file_contents => 'Hi' }
        }

        it { is_expected.to contain_file('/home/text.txt').with_content('Hi') }
      end
    end

However, currently the Hiera item "text" must exist somewhere. This is found in a file `spec/fixtures/hiera/default.yaml`
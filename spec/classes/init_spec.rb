require 'spec_helper'

describe 'refresh' do
  it { should compile }

  context 'with file_contents => Hi' do
    let(:params) { 
      { :file_contents => 'Hi' }
    }

    it { is_expected.to contain_file('/home/text.txt').with_content('Hi') }
  end
end
require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

describe package('nginx') do
  it { should be_installed }
end

describe package('supervisor') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
end

describe service('supervisor') do
  it { should be_enabled }
end

describe file('/etc/nginx/conf.d/app.conf') do
  it { should be_file }
end

describe file('/etc/supervisor/conf.d/app.conf') do
  it { should be_file }
end

describe command('PATH=/opt/perl-5.20/bin:%PATH% perl -V:version') do
  its(:stdout) { should contain('5.20.1') }
end

describe command('PATH=/opt/perl-5.20/bin:%PATH% carton --version') do
  its(:exit_status) { should eq 0 }
end

describe port(80) do
  it { should be_listening.with('tcp') }
end

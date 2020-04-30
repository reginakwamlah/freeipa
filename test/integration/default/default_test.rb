# InSpec test for recipe freeipa::default
# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/
unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end
# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end
# package
describe package('freeipa-server') do
  it { should be_installed }
end
# service
describe service('freeipa-server') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
# package
describe package('ipa-server-dns') do
  it { should be_installed }
end
# service
describe service('ipa-server-dns') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
# package
describe package('bind-dyndb') do
  it { should be_installed }
end
# service
describe service('bind-dyndb') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

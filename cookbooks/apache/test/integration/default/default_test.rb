# InSpec test for recipe apache::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# Test if a file is file
describe file('/etc/motd') do
  it { should be_file }
end

# Test the content of file
describe file ('/etc/motd') do
  its('content') { should match /this is me/ }
end

# Test the owner of the file
describe file('/etc/motd') do
  it { should be_owned_by 'root' }
end

# Test the content of the file
describe file('/etc/motd') do
  its('content') { should match(%r{.*Proper.*}) }
end

# Test package installation and version
describe package('tree') do
  it { should be_installed }
  its('version') { should cmp >= '1.0' }
end

# Test port listening
describe port(80) do
  it { should be_listening }
end

describe command('curl localhost') do
  its('stdout') { should match('Hello, world') }  
end



# # encoding: utf-8

# Inspec test for recipe nexus-iq::configure

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe service 'nxiq' do
  it { should be_enabled }
  it { should be_running }
end

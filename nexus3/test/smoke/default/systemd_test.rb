#
# Cookbook:: nexus3
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
#

# Inspec test for recipe nexus3::systemd

describe service 'nxrm' do
  it { should be_enabled }
  it { should be_running }
end

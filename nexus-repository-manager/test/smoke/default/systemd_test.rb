#
# Cookbook:: nexus-repository-manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
#

# Inspec test for recipe nexus3::systemd

describe service 'nexus-repository-manager' do
  it { should be_enabled }
  it { should be_running }
end

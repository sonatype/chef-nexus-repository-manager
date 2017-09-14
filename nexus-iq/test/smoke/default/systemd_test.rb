#
# Cookbook:: nexus-iq
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
#

# Inspec test for recipe nexus-iq::systemd

describe service 'nxiq' do
  it { should be_enabled }
  it { should be_running }
end

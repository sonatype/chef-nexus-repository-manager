#
# Cookbook:: nexus-iq-server
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus-iq-server::systemd

describe service 'nexus-iq-server' do
  it { should be_enabled }
  it { should be_running }
end

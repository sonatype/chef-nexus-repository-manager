#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::systemd

describe service 'nexus-repository-manager' do
  it { should be_enabled }
  it { should be_running }
end

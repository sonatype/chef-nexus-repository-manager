#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Permissions test for recipe nexus_repository_manager::rh-docker

control 'rh-docker-perms-test-001' do
  title 'Allows nexus user to mutate /etc/password'
  describe user('nexus') do
    it { should exist }
  end

  describe file('/etc/passwd') do
    it { should be_allowed('write', by_user: 'nexus') }
  end
end

control 'rh-docker-perms-test-002' do
 title 'Creates a template for passwd'
  describe file('/etc/passwd.template') do
    it { should exist }
  end
end

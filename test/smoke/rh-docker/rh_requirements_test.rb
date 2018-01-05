#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Red Hat requirements test for recipe nexus_repository_manager::rh-docker

control 'rh-docker-requirements-test-001' do
  title 'Includes the required files for Red Hat certification'
  describe file('/help.1') do
    it { should exist }
  end

  describe file('/licenses/LICENSE') do
    it { should exist }
  end
end

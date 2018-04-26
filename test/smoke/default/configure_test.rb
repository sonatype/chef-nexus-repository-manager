#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }
end

describe file('/opt/sonatype/nexus/etc/nexus-default.properties') do
  it { should exist }

  context 'when application_port is default' do
    its('content') { should include 'application-port=8081' }
  end

  context 'when application_host is default' do
    its('content') { should include 'application-host=0.0.0.0' }
  end

  context 'when nexus_context_path is default' do
    its('content') { should include 'nexus-context-path=/' }
  end

  context 'when nexus_clustered is default' do
    its('content') { should include 'nexus.clustered=false' }
  end

  context 'when nexus_licenseFile is default' do
    its('content') { should_not include 'nexus.licenseFile=' }
  end
end

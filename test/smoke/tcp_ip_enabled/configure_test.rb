#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when tcp-ip is enabled' do
    its('content') { should include '<tcp-ip enabled="true">' }
  end

  context 'when tcp-ip interface is set' do
    its('content') { should include '<interface>10.0.1.1</interface>' }
  end

  context 'when tcp-ip members are set' do
    its('content') { should include '<member>10.0.1.2</member>' }
    its('content') { should include '<member>10.0.1.3</member>' }
    its('content') { should include '<member>10.0.1.4</member>' }
  end

  context 'when multicast is disabled' do
    its('content') { should include '<multicast enabled="false">' }
  end

  context 'when aws is disabled' do
    its('content') { should include '<aws enabled="false">' }
  end

  context 'when hazelcast discovery is disabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">false</property>' }
    its('content') { should_not include '<discovery-strategy enabled="false" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
  end  
end

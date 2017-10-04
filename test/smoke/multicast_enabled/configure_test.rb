#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when multicast is enabled' do
    its('content') { should include '<multicast enabled="true">' }
  end

  context 'when multicast group is set' do
    its('content') { should include '<multicast-group>123.4.5.6</multicast-group>' }
  end

  context 'when multicast port is set' do
    its('content') { should include '<multicast-port>54321</multicast-port>' }
  end

  context 'when aws is disabled' do
    its('content') { should include '<aws enabled="false">' }
  end

  context 'when tcp_ip is disabled' do
    its('content') { should include '<tcp-ip enabled="false">' }
  end

  context 'when hazelcast discovery is disabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">false</property>' }
    its('content') { should_not include '<discovery-strategy enabled="false" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
  end
end

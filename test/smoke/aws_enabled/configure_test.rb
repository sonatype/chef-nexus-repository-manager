#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when aws is enabled' do
    its('content') { should include '<aws enabled="true">' }
  end

  context 'when aws iam_role is default' do
    its('content') { should include '<iam-role>test-iam-role</iam-role>' }
  end

  context 'when region is set' do
    its('content') { should include '<region>test-region</region>' }
  end

  context 'when tag_key is set' do
    its('content') { should include '<tag-key>test-tag-key</tag-key>' }
  end

  context 'when tag_value is set' do
    its('content') { should include '<tag-value>test-tag-value</tag-value>' }
  end

  context 'when multicast is disabled' do
    its('content') { should include '<multicast enabled="false">' }
  end

  context 'when tcp_ip is disabled' do
    its('content') { should include '<tcp-ip enabled="false">' }
  end

  context 'when hazelcast discovery is disabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">false</property>' }
    its('content') { should_not include '<discovery-strategy enabled="false" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
  end
end

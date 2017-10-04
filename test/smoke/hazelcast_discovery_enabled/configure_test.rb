#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when hazelcast discovery is enabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">true</property>' }
    its('content') { should include '<discovery-strategy enabled="true" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
  end

  context 'when iam_role is set' do
    its('content') { should include '<property name="iam-role">test-hz-iam-role</property>' }
  end

  context 'when security_group_name is set' do
    its('content') { should include '<property name="security-group-name">test-hz-security-group-name</property>' }
  end

  context 'when region is set' do
    its('content') { should include '<property name="region">test-hz-region</property>' }
  end

  context 'when tag_key is set' do
    its('content') { should include '<property name="tag-key">test-hz-tag-key</property>' }
  end

  context 'when tag_value is set' do
    its('content') { should include '<property name="tag-value">test-hz-tag-value</property>' }
  end

  context 'when hz_port is set' do
    its('content') { should include '<property name="hz-port">5708</property>' }
  end

  context 'when multicast is disabled' do
    its('content') { should include '<multicast enabled="false">' }
  end

  context 'when tcp_ip is disabled' do
    its('content') { should include '<tcp-ip enabled="false">' }
  end

  context 'when aws is disabled' do
    its('content') { should include '<aws enabled="false">' }
  end  
end

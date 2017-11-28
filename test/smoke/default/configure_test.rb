#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when group name is set' do
    its('content') { should include '<name>nexus</name>' }
  end

  context 'when group password is set' do
    its('content') { should include '<password>nexus123</password>' }
  end

  context 'when multicast is enabled' do
    its('content') { should include '<multicast enabled="true">' }
  end

  context 'when multicast group is set' do
    its('content') { should include '<multicast-group>224.2.2.3</multicast-group>' }
  end

  context 'when multicast port is set' do
    its('content') { should include '<multicast-port>54327</multicast-port>' }
  end

  context 'when tcp-ip is disabled' do
    its('content') { should include '<tcp-ip enabled="false">' }
  end

  context 'when tcp-ip interface is default' do
    its('content') { should include '<interface>127.0.0.1</interface>' }
  end

  context 'when tcp-ip members are default' do
    its('content') { should include '<member>127.0.0.1</member>' }
  end

  context 'when aws is disabled' do
    its('content') { should include '<aws enabled="false">' }
  end

  context 'when aws iam_role is default' do
    its('content') { should include '<iam-role></iam-role>' }
  end

  context 'when region is default' do
    its('content') { should include '<region>us-east-1</region>' }
  end

  context 'when tag_key is set' do
    its('content') { should include '<tag-key>Platform</tag-key>' }
  end

  context 'when tag_value is set' do
    its('content') { should include '<tag-value>nexus-repository-manager</tag-value>' }
  end

  context 'when hazelcast discovery is disabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">false</property>' }
    its('content') { should_not include '<discovery-strategy enabled="false" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
  end  
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

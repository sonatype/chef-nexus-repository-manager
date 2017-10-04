#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when hazelcast discovery is disabled' do
    its('content') { should include '<property name="hazelcast.discovery.enabled">false</property>' }
    its('content') { should_not include '<discovery-strategy enabled="false" class="com.hazelcast.aws.AwsDiscoveryStrategy">' }
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

  context 'when aws enabled is default' do
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
end

describe file('/nexus-data/etc/nexus.properties') do
  it { should exist }

  context 'when application_port is default' do
    its('content') { should include '# application-port=8081' }
  end

  context 'when application_host is default' do
    its('content') { should include '# application-host=0.0.0.0' }
  end

  context 'when nexus_context_path is default' do
    its('content') { should include '# nexus-context-path=/' }
  end

  context 'when nexus_loadAsOSS is false' do
    its('content') { should_not include 'nexus.loadAsOSS' }
  end

  context 'when nexus_clustered is false' do
    its('content') { should_not include 'nexus.clustered' }
  end

  context 'when nexus_licenseFile is blank' do
    its('content') { should_not include 'nexus.licenseFile' }
  end
end

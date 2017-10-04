#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/fabric/hazelcast.xml') do
  it { should exist }

  context 'when multicast is enabled' do
    its('content') { should include '<multicast enabled="false">' }
  end

  context 'when multicast group is set' do
    its('content') { should include '<multicast-group>123.4.5.6</multicast-group>' }
  end

  context 'when multicast port is set' do
    its('content') { should include '<multicast-port>54321</multicast-port>' }
  end

  context 'when aws enabled is default' do
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
end

describe file('/nexus-data/etc/nexus.properties') do
  it { should exist }

  context 'when application_port is set' do
    its('content') { should include 'application-port=8082' }
  end

  context 'when application_host is set' do
    its('content') { should include 'application-host=127.0.0.1' }
  end

  context 'when nexus_context_path is set' do
    its('content') { should include 'nexus-context-path=/test-context' }
  end

  context 'when nexus_loadAsOSS is true' do
    its('content') { should include 'nexus.loadAsOSS=true' }
  end

  context 'when nexus_clustered is true' do
    its('content') { should include 'nexus.clustered=true' }
  end

  context 'when nexus_licenseFile is not blank' do
    its('content') { should include 'nexus.licenseFile=/opt/sonatype/license.lic' }
  end
end

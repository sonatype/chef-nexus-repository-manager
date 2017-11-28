#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::configure

describe file('/opt/sonatype/nexus/etc/nexus-default.properties') do
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

  context 'when nexus_clustered is true' do
    its('content') { should include 'nexus.clustered=true' }
  end

  context 'when nexus_license_file is not blank' do
    its('content') { should include 'nexus.licenseFile=/opt/sonatype/license.lic' }
  end
end

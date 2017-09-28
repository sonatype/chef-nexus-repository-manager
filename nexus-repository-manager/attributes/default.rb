#
# Cookbook:: nexus-repository-manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = '40b95b097b43cc8941a9700d24baf25ef94867286e43eaffa37cf188726bb2a7'
default['java']['oracle']['accept_oracle_download_terms'] = true
default['java']['jdk']['8']['bin_cmds'] = [];

default['nexus-repository-manager']['version'] = '3.6.0-02'
default['nexus-repository-manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus-repository-manager']['version']}-unix.tar.gz"
default['nexus-repository-manager']['checksum'] = '477969da1ea3a532247be628e5ca2b466c9653e88ba51d51a1609eacb0a45b4b'

default['nexus-repository-manager']['sonatype']['dir'] = '/opt/sonatype'
default['nexus-repository-manager']['sonatype']['work']['dir'] = default['nexus-repository-manager']['sonatype']['dir'] + '/sonatype_work'
default['nexus-repository-manager']['sonatype']['work']['nexus3']['dir'] = default['nexus-repository-manager']['sonatype']['work']['dir'] + '/nexus3'

default['nexus-repository-manager']['nexus']['home']['dir'] = default['nexus-repository-manager']['sonatype']['dir'] + '/nexus'
default['nexus-repository-manager']['nexus']['home']['bin']['dir'] = default['nexus-repository-manager']['nexus']['home']['dir'] + '/bin'

default['nexus-repository-manager']['nexus']['data']['dir'] = '/nexus-data'
default['nexus-repository-manager']['nexus']['data']['etc']['dir'] = default['nexus-repository-manager']['nexus']['data']['dir'] + '/etc'
default['nexus-repository-manager']['nexus']['data']['log']['dir'] = default['nexus-repository-manager']['nexus']['data']['dir'] + '/log'
default['nexus-repository-manager']['nexus']['data']['tmp']['dir'] = default['nexus-repository-manager']['nexus']['data']['dir'] + '/tmp'

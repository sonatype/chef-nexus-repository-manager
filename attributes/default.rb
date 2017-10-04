#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'e8a341ce566f32c3d06f6d0f0eeea9a0f434f538d22af949ae58bc86f2eeaae4'
default['java']['oracle']['accept_oracle_download_terms'] = true
# This prevents the java recipe from configuring java alternatives
default['java']['jdk']['8']['bin_cmds'] = [];

default['nexus_repository_manager']['version'] = '3.6.0-02'
default['nexus_repository_manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus_repository_manager']['version']}-unix.tar.gz"
default['nexus_repository_manager']['checksum'] = '40b95b097b43cc8941a9700d24baf25ef94867286e43eaffa37cf188726bb2a7'
default['nexus_repository_manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus_repository_manager']['sonatype']['sonatype_work']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/sonatype-work'
default['nexus_repository_manager']['sonatype']['sonatype_work']['nexus3']['path'] = default['nexus_repository_manager']['sonatype']['sonatype_work']['path'] + '/nexus3'
default['nexus_repository_manager']['nexus']['home']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/nexus'
default['nexus_repository_manager']['nexus']['home']['bin']['path'] = default['nexus_repository_manager']['nexus']['home']['path'] + '/bin'
default['nexus_repository_manager']['nexus']['data']['path'] = '/nexus-data'
default['nexus_repository_manager']['nexus']['data']['etc']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/etc'
default['nexus_repository_manager']['nexus']['data']['log']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/log'
default['nexus_repository_manager']['nexus']['data']['tmp']['path'] = default['nexus_repository_manager']['nexus']['data']['path'] + '/tmp'

# hazelcast configuration
## multicast configuration
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['enabled'] = true
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['multicast_group'] = '224.2.2.3'
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['multicast_port'] = 54327

## aws configuration
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['tag_value'] = 'nexus-repository-manager'

## hazelcast discovery configuration
default['nexus_repository_manager']['properties']['hazelcast']['discovery']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['security_group_name'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['tag_value'] = 'nexus-repository-manager'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['hz_port'] = 5701

# nexus.properties configuration
default['nexus_repository_manager']['nexus_properties']['application_port'] = '8081'
default['nexus_repository_manager']['nexus_properties']['application_host'] = '0.0.0.0'
default['nexus_repository_manager']['nexus_properties']['nexus_context_path'] = '/'
default['nexus_repository_manager']['nexus_properties']['nexus_loadAsOSS'] = false
default['nexus_repository_manager']['nexus_properties']['nexus_clustered'] = false
default['nexus_repository_manager']['nexus_properties']['nexus_licenseFile'] = ''

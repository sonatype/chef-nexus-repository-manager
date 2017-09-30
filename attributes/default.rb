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

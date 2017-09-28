#
# Cookbook:: nexus-repository-manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'e8a341ce566f32c3d06f6d0f0eeea9a0f434f538d22af949ae58bc86f2eeaae4'
default['java']['oracle']['accept_oracle_download_terms'] = true
# This prevents the java recipe from configuring java alternatives
default['java']['jdk']['8']['bin_cmds'] = [];

default['nexus-repository-manager']['version'] = '3.6.0-02'
default['nexus-repository-manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus-repository-manager']['version']}-unix.tar.gz"
default['nexus-repository-manager']['checksum'] = '40b95b097b43cc8941a9700d24baf25ef94867286e43eaffa37cf188726bb2a7'
default['nexus-repository-manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus-repository-manager']['sonatype']['sonatype_work']['path'] = default['nexus-repository-manager']['sonatype']['path'] + '/sonatype-work'
default['nexus-repository-manager']['sonatype']['sonatype_work']['nexus3']['path'] = default['nexus-repository-manager']['sonatype']['sonatype_work']['path'] + '/nexus3'
default['nexus-repository-manager']['nexus']['home']['path'] = default['nexus-repository-manager']['sonatype']['path'] + '/nexus'
default['nexus-repository-manager']['nexus']['home']['bin']['path'] = default['nexus-repository-manager']['nexus']['home']['path'] + '/bin'
default['nexus-repository-manager']['nexus']['data']['path'] = '/nexus-data'
default['nexus-repository-manager']['nexus']['data']['etc']['path'] = default['nexus-repository-manager']['nexus']['data']['path'] + '/etc'
default['nexus-repository-manager']['nexus']['data']['log']['path'] = default['nexus-repository-manager']['nexus']['data']['path'] + '/log'
default['nexus-repository-manager']['nexus']['data']['tmp']['path'] = default['nexus-repository-manager']['nexus']['data']['path'] + '/tmp'

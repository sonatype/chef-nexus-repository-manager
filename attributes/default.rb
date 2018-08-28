#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/server-jre-8u181-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = '0b26c7fcfad20029e6e0989e678efcd4a81f0fe502a478b4972215533867de1b'
default['java']['oracle']['accept_oracle_download_terms'] = true

# nexus configuration
default['nexus_repository_manager']['version'] = '3.13.0-01'
default['nexus_repository_manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus_repository_manager']['version']}-unix.tar.gz"
default['nexus_repository_manager']['nexus_download_sha256'] = '5d1890f45e95e2ca74e62247be6b439482d2fe4562a7ec8ae905c4bdba6954ce'
default['nexus_repository_manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus_repository_manager']['nexus_data']['path'] = '/nexus-data'
default['nexus_repository_manager']['license_s3_bucket'] = nil
default['nexus_repository_manager']['license_s3_path'] = nil

# nexus.properties configuration
default['nexus_repository_manager']['properties']['application_port'] = '8081'
default['nexus_repository_manager']['properties']['application_host'] = '0.0.0.0'
default['nexus_repository_manager']['properties']['context_path'] = '/'
default['nexus_repository_manager']['properties']['license_file'] = nil

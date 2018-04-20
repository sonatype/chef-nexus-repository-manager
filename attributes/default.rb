#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = 'b6dd2837efaaec4109b36cfbb94a774db100029f98b0d78be68c27bec0275982'
default['java']['oracle']['accept_oracle_download_terms'] = true

# nexus configuration
default['nexus_repository_manager']['version'] = '3.9.0-01'
default['nexus_repository_manager']['nexus_download_url'] = "https://download.sonatype.com/nexus/3/nexus-#{node['nexus_repository_manager']['version']}-unix.tar.gz"
default['nexus_repository_manager']['nexus_download_sha256'] = '9989a455bda4c62032b10b98c2a1ac40b3be78feca90edf4f714a91da08f24ac'
default['nexus_repository_manager']['sonatype']['path'] = '/opt/sonatype'
default['nexus_repository_manager']['nexus_data']['path'] = '/nexus-data'
default['nexus_repository_manager']['license_s3_bucket'] = nil
default['nexus_repository_manager']['license_s3_path'] = nil

# nexus.properties configuration
default['nexus_repository_manager']['properties']['application_port'] = '8081'
default['nexus_repository_manager']['properties']['application_host'] = '0.0.0.0'
default['nexus_repository_manager']['properties']['context_path'] = '/'
default['nexus_repository_manager']['properties']['license_file'] = nil

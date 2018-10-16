#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/server-jre-8u192-linux-x64.tar.gz'
default['java']['jdk']['8']['x86_64']['checksum'] = '3d811a5ec65dc6fc261f488757bae86ecfe285a79992363b016f60cdb4dbe7e6'
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

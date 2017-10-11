#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

# group configuration
default['nexus_repository_manager']['hazelcast']['group']['name'] = 'nexus'
default['nexus_repository_manager']['hazelcast']['group']['password'] = 'nexus123'

# multicast configuration
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['enabled'] = true
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['multicast_group'] = '224.2.2.3'
default['nexus_repository_manager']['hazelcast']['network']['join']['multicast']['multicast_port'] = 54327

# tcp-ip configuration
default['nexus_repository_manager']['hazelcast']['network']['join']['tcp_ip']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['network']['join']['tcp_ip']['interface'] = '127.0.0.1'
default['nexus_repository_manager']['hazelcast']['network']['join']['tcp_ip']['members'] = ['127.0.0.1']

# aws configuration
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['network']['join']['aws']['tag_value'] = 'nexus-repository-manager'

# hazelcast discovery configuration
default['nexus_repository_manager']['hazelcast']['properties']['discovery']['enabled'] = false
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['iam_role'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['region'] = 'us-east-1'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['tag_key'] = 'Platform'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['security_group_name'] = ''
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['tag_value'] = 'nexus-repository-manager'
default['nexus_repository_manager']['hazelcast']['network']['join']['hazelcast_discovery']['hz_port'] = 5701

#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

# sonatype-work
default['nexus_repository_manager']['sonatype_work']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/sonatype-work'
default['nexus_repository_manager']['sonatype_work']['nexus3']['path'] = default['nexus_repository_manager']['sonatype_work']['path'] + '/nexus3'

# nexus home
default['nexus_repository_manager']['nexus_home']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/nexus'
default['nexus_repository_manager']['nexus_home']['bin']['path'] = default['nexus_repository_manager']['nexus_home']['path'] + '/bin'

# nexus data
default['nexus_repository_manager']['nexus_data']['etc']['path'] = default['nexus_repository_manager']['nexus_data']['path'] + '/etc'
default['nexus_repository_manager']['nexus_data']['log']['path'] = default['nexus_repository_manager']['nexus_data']['path'] + '/log'
default['nexus_repository_manager']['nexus_data']['tmp']['path'] = default['nexus_repository_manager']['nexus_data']['path'] + '/tmp'

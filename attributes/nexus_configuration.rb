#
# Cookbook:: nexus_repository_manager

# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

# sonatype-work
default['nexus_repository_manager']['sonatype_work']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/sonatype-work'

# nexus home
default['nexus_repository_manager']['nexus_home']['path'] = default['nexus_repository_manager']['sonatype']['path'] + '/nexus'

# nexus data
default['nexus_repository_manager']['nexus_data']['etc']['path'] = default['nexus_repository_manager']['nexus_data']['path'] + '/etc'
default['nexus_repository_manager']['nexus_data']['log']['path'] = default['nexus_repository_manager']['nexus_data']['path'] + '/log'

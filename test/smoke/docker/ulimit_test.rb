
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::docker

describe limits_conf('/etc/security/limits.conf') do
  its('nexus') { should include ['soft', 'nofile', '65536'], ['hard', 'nofile', '65536'] }
end

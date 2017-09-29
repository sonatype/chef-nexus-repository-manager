#
# Cookbook:: nexus_repository_manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

# Inspec test for recipe nexus_repository_manager::download

describe user('nexus') do
  it { should exist }
end

describe group('nexus') do
  it { should exist }
end

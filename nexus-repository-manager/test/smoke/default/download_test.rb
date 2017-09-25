#
# Cookbook:: nexus-repository-manager
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
#

# Inspec test for recipe nexus-iq::download

describe user('nexus') do
  it { should exist }
end

describe group('nexus') do
  it { should exist }
end

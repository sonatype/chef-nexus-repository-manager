#
# Cookbook:: nexus_repository_manager
# Recipe:: rhel-docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'nexus_repository_manager::docker'

group 'root' do
  action :modify
  members 'nexus'
  append true
end

directory '/licenses/' do
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

[ 'help.1', 'uid_template.sh', 'uid_entrypoint.sh', 'licenses/LICENSE' ].each do | file |
  cookbook_file "/#{file}" do
    source "rhel-docker/#{file}"
    owner 'root'
    group 'root'
    mode '755'
  end
end

bash 'uid_template.sh' do
  code <<-EOH
    /uid_template.sh
  EOH
end

file '/etc/passwd' do
  mode '664'
end

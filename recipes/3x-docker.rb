#
# Cookbook:: nexus_repository_manager
# Recipe:: 3x-docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

if node['platform'] == 'rhel'
  default['yum']['rhel-7-server-rpms']['enabled'] = true
  default['yum']['rhel-7-server-rpms']['managed'] = true
  default['yum']['rhel-7-server-optional-rpms']['enabled'] = true
  default['yum']['rhel-7-server-optional-rpms']['managed'] = true
  default['yum']['rhel-7-server-thirdparty-oracle-java-rpms']['enabled'] = true
  default['yum']['rhel-7-server-thirdparty-oracle-java-rpms']['managed'] = true
end

include_recipe 'nexus_repository_manager::users'
include_recipe 'nexus_repository_manager::download'
include_recipe 'nexus_repository_manager::configure'

set_limit 'nexus' do
  type 'hard'
  item 'nofile'
  value 65536
  use_system true
end

set_limit 'nexus' do
  type 'soft'
  item 'nofile'
  value 65536
  use_system true
end

ruby_block "remove java memory settings from nexus.vmoptions" do
  block do
    file = Chef::Util::FileEdit.new(node['nexus_repository_manager']['nexus_home']['path'] + '/bin/nexus.vmoptions')
    file.search_file_delete_line(/^-Xms/)
    file.search_file_delete_line(/^-Xmx/)
    file.search_file_delete_line(/^-XX:MaxDirectMemorySize/)
    file.write_file
  end
end

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
    source "rh-docker/#{file}"
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

#
# Cookbook:: nexus_repository_manager
# Recipe:: docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'nexus_repository_manager::default'
include_recipe 'poise-python'

template node['nexus_repository_manager']['nexus']['home']['bin']['path'] + '/cloudformation-signal.sh' do
  source 'cloudformation-signal.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template node['nexus_repository_manager']['nexus']['home']['bin']['path'] + '/verify-cloud-init.py' do
  source 'verify-cloud-init.py.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

directory node['nexus_repository_manager']['nexus']['home']['path'] + '/.aws/' do
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

template node['nexus_repository_manager']['nexus']['home']['path'] + '/.aws/config' do
  source 'aws/config.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/home/awslogs/.aws/' do
  owner 'awslogs'
  group 'awslogs'
  mode '755'
  action :create
end

template '/home/awslogs/.aws/config' do
  source 'aws/config.erb'
  owner 'awslogs'
  group 'awslogs'
  mode '0644'
end

directory '/etc/awslogs' do
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

directory node['awslogs']['data'] do
  owner 'awslogs'
  group 'awslogs'
  mode '755'
  action :create
end

template '/etc/awslogs/nexus.conf' do
  source 'awslogs/conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

python_package 'awscli'

python_package 'awscli-cwlogs'

systemd_unit 'awslogs-agent.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=AWS CloudWatch Logs agent
  After=syslog.service
  [Service]
  Type=simple
  ExecStart=/bin/aws logs push --config-file /etc/awslogs/nexus.conf
  User=awslogs
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end

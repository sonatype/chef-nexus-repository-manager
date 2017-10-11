#
# Cookbook:: nexus_repository_manager
# Recipe:: docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'poise-python'

directory '/opt/cloudformation/' do
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

template '/opt/cloudformation/signal-completion.sh' do
  source 'aws/signal-completion.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/opt/cloudformation/verify-cloud-init.py' do
  source 'aws/verify-cloud-init.py.erb'
  owner 'root'
  group 'root'
  mode '0755'
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

include_recipe 'nexus_repository_manager::default'

execute 'signal_completion' do
  command '/opt/cloudformation/signal-completion.sh &'
end
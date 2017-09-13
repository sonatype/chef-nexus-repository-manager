#
# Cookbook:: nexus-iq
# Recipe:: configure
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

nxiq_jar = node['nexus-iq']['install_dir'] + "/nexus-iq-server-#{node['nexus-iq']['version']}.jar"
config_path = '/etc/nxiq/config.yml'

directory File.dirname(config_path) do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template config_path do
  source 'config.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'systemd_unit[nxiq.service]'
end

systemd_unit 'nxiq.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=nexus-iq service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  WorkingDirectory=#{ node['nexus-iq']['install_dir'] }
  ExecStart=/usr/bin/java -jar #{nxiq_jar} server #{config_path}
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end


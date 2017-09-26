#
# Cookbook:: nexus-repository-manager
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

systemd_unit 'nexus-repository-manager.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Nexus Repository Manager service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  ExecStart=#{ node['nexus-repository-manager']['sonatype_dir'] }/start-nexus-repository-manager.sh
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end

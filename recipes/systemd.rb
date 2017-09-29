#
# Cookbook:: nexus_repository_manager
# Recipe:: systemd
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

systemd_unit 'nexus_repository_manager.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Nexus Repository Manager service
  After=network.target
  [Service]
  Type=simple
  LimitNOFILE=65536
  ExecStart=#{ node['nexus_repository_manager']['sonatype']['path'] }/start_nexus_repository_manager.sh
  User=nexus
  Restart=on-abort
  [Install]
  WantedBy=multi-user.target
  EOU
  action [:create, :enable, :start]
end

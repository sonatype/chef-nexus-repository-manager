#
# Cookbook:: nexus-repository-manager
# Recipe:: download
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. All rights reserved.

tar_extract "http://download.oracle.com/otn-pub/java/jdk/#{node['java']['version_major']}u#{node['java']['version_minor']}-b#{node['java']['version_build']}/#{node['java']['download_hash']}/server-jre-8u144-linux-x64.tar.gz" do
  headers ({ "Cookie" => "oraclelicense=accept-securebackup-cookie;" })
  target_dir '/opt'
  user 'root'
  group 'root'
end

link '/opt/java' do
  to "/opt/jdk1.#{node['java']['version_major']}.0_#{node['java']['version_minor']}"
  owner 'root'
  group 'root'
end


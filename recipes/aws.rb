#
# Cookbook:: nexus_repository_manager
# Recipe:: docker
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.

include_recipe 'poise-python'

region = node['nexus_repository_manager']['aws']['region']

Chef.event_handler do
  on :run_failed do |exception|
    system('/opt/cloudformation/signal-completion.sh false')
  end
end

Chef.event_handler do
  on :run_completed do
    system('/opt/cloudformation/signal-completion.sh true')
  end
end

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

nexus_log = node['nexus_repository_manager']['nexus_data']['log']['path'] + '/nexus.log'

bash 'wait for nexus startup' do
  code <<-EOH
    until grep -m 1 "Started Sonatype Nexus" #{nexus_log} ; do
      systemctl is-active nexus-repository-manager.service || exit 1
      sleep 1
    done
  EOH
end

python 'check instance health' do
  code <<-EOH.gsub(/^\s+/, '')
    import boto3, sys
    instance_id = open('/var/lib/cloud/data/instance-id', 'r').readline().strip()
    elb_client = boto3.client('elb', region_name='#{region}')
    elbs = elb_client.describe_load_balancers()['LoadBalancerDescriptions']
    elb_name = [e['LoadBalancerName'] for e in elbs if instance_id in [ i['InstanceId'] for i in e['Instances'] ]]
    inst_health = elb_client.describe_instance_health(LoadBalancerName=elb_name[0], Instances=[{'InstanceId':instance_id}])
    if inst_health['InstanceStates'][0]['State'] != 'InService': sys.exit(1)
  EOH
  retries 300
  retry_delay 2
  only_if { node['nexus_repository_manager']['properties']['clustered'] == 'true' }
end

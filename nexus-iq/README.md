# nexus-iq

Cookbook for Nexus IQ server.

Because this cookbook isn't public it is accessed by the nexus cloudformation stack via a public bucket as intermediary. To update the cookbook run:

`berks package`

and then upload the resulting archive to the int-public bucket like this:


`aws s3 cp /Users/mac/IdeaProjects/nexus-chef-cookbook/nexus-iq/cookbooks-nnnnnnn.tar.gz s3://int-public/nxiq-cookbook.tar.gz`
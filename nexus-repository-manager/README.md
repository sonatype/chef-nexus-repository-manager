## nexus-repository-manager

Cookbook for Nexus Repository Manager.

Because this cookbook isn't public (yet) it can only be accessed by the docker/nexus3 Dockerfile via a public bucket as intermediary.

To update the cookbook run:

    berks package

Then upload the resulting archive to the `int-public` bucket like this:

    aws s3 cp cookbooks-nnnnnnn.tar.gz s3://int-public/nexus-repository-manager-cookbook.tar.gz --acl public-read

#### Usage

Simply include the `nexus-repository-manager` recipe wherever you would like Nexus Repository Manager installed. Simply add
`recipe['nexus-repository-manager']` to your runlist or `include_recipe 'nexus-repository-manager'` to your cookbook. This will
install Nexus Repository Manager managed as a systemd service.

We also provide a `nexus-repository-manager::docker` recipe which is exactly the same but without installing a systemd service.

#### Recipes

 - nexus-repository-manager::default
   Installs Nexus Repository Manager and starts it as systemd service.
 - nexus-repository-manager::docker
   Installs Nexus Repository Manager. Instead of a systemd service a startup script `start-nexus-repository-manager.sh` is provided in install_dir.

#### Testing

We provide a simple smoke test for this cookbook. Use this command to run it:

    kitchen test

#### Supported platforms

We run our tests against `centos-7.3` as well as `ubuntu-16.04`. However all major systemd based distributions should
work fine.

The alternative `nexus-repository-manager::docker` recipe does not require systemd.

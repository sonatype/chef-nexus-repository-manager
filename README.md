## Cookbook for Nexus Repository Manager

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
 - nexus-repository-manager::rhel-docker
   Uses the nexus-repository-manager::docker recipe but includes additional meta data to comform with Atomic and
   OpenShift standards, a directory with the licenses applicable to the software and a man file for help on how to use
   the software. It also uses an ENTRYPOINT script the ensure the running user has access to the appropriate 
   permissions for OpenShift 'restricted' SCC.

#### Red Hat help.1

The man file included in the Red Hat image is generated from this [help markdown](files/rhel-docker/help.md). Markdown
can be converted to the appropriate format using [md2roff](https://github.com/nereusx/md2roff). This process is
currently not part of the automated build and needs to be done manually after any update to the help markdown.

#### Testing

We provide a simple smoke test for this cookbook. Use this command to run it:

    kitchen test

#### Supported platforms

We run our tests against `centos-7.3` as well as `ubuntu-16.04`. However all major systemd based distributions should
work fine.

The alternative `nexus-repository-manager::docker` recipe does not require systemd.

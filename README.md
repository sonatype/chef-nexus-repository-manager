## Cookbook for Nexus Repository Manager

#### Usage

Simply include the `nexus_repository_manager` recipe wherever you would like Nexus Repository Manager installed. Simply add
`recipe['nexus_repository_manager']` to your runlist or `include_recipe 'nexus_repository_manager'` to your cookbook. This will
install Nexus Repository Manager managed as a systemd service.

We also provide a `nexus_repository_manager::docker` recipe which is exactly the same but without installing a systemd service.

#### Recipes

 - nexus_repository_manager::default
   Installs Nexus Repository Manager and starts it as systemd service.
 - nexus_repository_manager::docker
   Installs Nexus Repository Manager. Instead of a systemd service a startup script `start-nexus-repository-manager.sh` is provided in install_dir.
 - nexus_repository_manager::rh-docker
   Uses the nexus_repository_manager::docker recipe but includes additional meta data to comform with Kubernetes and
   OpenShift standards, a directory with the licenses applicable to the software and a man file for help on how to use
   the software. It also uses an ENTRYPOINT script to ensure the running user has access to the appropriate 
   permissions for OpenShift 'restricted' SCC.
 - nexus_repository_manager::3x-docker
   Nearly identical to the rh-docker recipe, but excluding the java recipe

#### Red Hat help.1

The man file included in the Red Hat image is generated from this [help markdown](files/rh-docker/help.md). Markdown
can be converted to the appropriate format using [md2roff](https://github.com/nereusx/md2roff). This process is
currently not part of the automated build and needs to be done manually after any update to the help markdown.

#### Testing

We provide a simple smoke test for this cookbook. Use this command to run it:

    kitchen test

#### Supported platforms

We run our tests against `centos-7.3` as well as `ubuntu-16.04`. However all major systemd based distributions should
work fine.

The alternative `nexus_repository_manager::docker` recipe does not require systemd.

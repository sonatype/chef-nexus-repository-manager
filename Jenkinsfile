/*
 * Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
 */
@Library('zion-pipeline-library')
import com.sonatype.jenkins.pipeline.GitHub
import com.sonatype.jenkins.pipeline.OsTools

properties([
  parameters([
    string(defaultValue: '', description: 'New Nexus RM Version', name: 'nexus_rm_version'),
    string(defaultValue: '', description: 'New Nexus RM Version Sha256', name: 'nexus_rm_version_sha'),
    string(defaultValue: '', description: 'New JRE Url', name: 'oracle_jre_url'),
    string(defaultValue: '', description: 'New JRE Sha256', name: 'oracle_jre_sha'),

    string(name: 'security_group_id', defaultValue: 'sg-a4fc5ec1',
        description: 'The security group id to use for the chef tests.'),
    string(name: 'subnet_id', defaultValue: 'subnet-c96f61bd',
        description: 'The subnet id to use for the chef tests.')
  ])
])
node('ubuntu-chef-zion') {
  def commitId, commitDate, imageId, apiToken, branch, defaultsFileLocation
  def organization = 'sonatype',
      repository = 'chef-nexus-repository-manager',
      credentialsId = 'integrations-github-api',
      archiveName = 'chef-nexus-repository-manager.tar.gz',
      cookbookName = 'nexus_repository_manager'
  GitHub gitHub

  try {
    stage('Preparation') {
      deleteDir()

      def checkoutDetails = checkout scm

      defaultsFileLocation = "${pwd()}/attributes/default.rb"

      branch = checkoutDetails.GIT_BRANCH == 'origin/master' ? 'master' : checkoutDetails.GIT_BRANCH
      commitId = checkoutDetails.GIT_COMMIT
      commitDate = OsTools.runSafe(this, "git show -s --format=%cd --date=format:%Y%m%d-%H%M%S ${commitId}")

      OsTools.runSafe(this, 'git config --global user.email sonatype-ci@sonatype.com')
      OsTools.runSafe(this, 'git config --global user.name Sonatype CI')

      env.VERSION = readVersion().split('-')[0] + ".${commitDate}.${commitId.substring(0, 7)}"

      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        apiToken = env.GITHUB_API_PASSWORD
      }
      gitHub = new GitHub(this, "${organization}/${repository}", apiToken)
    }
    if (params.nexus_rm_version && params.nexus_rm_version_sha) {
      stage('Update RM Version') {
        OsTools.runSafe(this, "git checkout ${branch}")
        def defaultsFile = readFile(file: defaultsFileLocation)

        def versionRegex = /(default\['nexus_repository_manager'\]\['version'\] = ')(\d\.\d\.\d\-\d{2})(')/
        def shaRegex = /(default\['nexus_repository_manager'\]\['nexus_download_sha256'\] = ')([A-Fa-f0-9]{64})(')/

        defaultsFile = defaultsFile.replaceAll(versionRegex, "\$1${params.nexus_rm_version}\$3")
        defaultsFile = defaultsFile.replaceAll(shaRegex, "\$1${params.nexus_rm_version_sha}\$3")

        writeFile(file: defaultsFileLocation, text: defaultsFile)
      }
    }
    if (params.oracle_jre_url && params.oracle_jre_sha) {
      stage('Update JRE Url') {
        OsTools.runSafe(this, "git checkout ${branch}")
        def defaultsFile = readFile(file: defaultsFileLocation)

        def urlRegex = /(default\['java'\]\['jdk'\]\['8'\]\['x86_64'\]\['url'\] = ')(http.*-linux-x64\.tar\.gz)(')/
        def shaRegex = /(default\['java'\]\['jdk'\]\['8'\]\['x86_64'\]\['checksum'\] = ')([A-Fa-f0-9]{64})(')/

        defaultsFile = defaultsFile.replaceAll(urlRegex, "\$1${params.oracle_jre_url}\$3")
        defaultsFile = defaultsFile.replaceAll(shaRegex, "\$1${params.oracle_jre_sha}\$3")

        writeFile(file: defaultsFileLocation, text: defaultsFile)
      }
    }
    stage('Build') {
      gitHub.statusUpdate commitId, 'pending', 'build', 'Build is running'

      def gemInstallDirectory = getGemInstallDirectory()
      withEnv(["PATH+GEMS=${gemInstallDirectory}/bin"]) {
        OsTools.runSafe(this, 'gem install --user-install berkshelf')
        OsTools.runSafe(this, 'berks package')
        dir('build/target') {
          OsTools.runSafe(this, "mv ${WORKSPACE}/cookbooks-*.tar.gz ${archiveName}")
        }
      }

      if (currentBuild.result == 'FAILURE') {
        gitHub.statusUpdate commitId, 'failure', 'build', 'Build failed'
        return
      } else {
        gitHub.statusUpdate commitId, 'success', 'build', 'Build succeeded'
      }
    }
    stage('Test') {
      gitHub.statusUpdate commitId, 'pending', 'test', 'Tests are running'

      def keyPairName = "chef-${UUID.randomUUID().toString()}"

      try {
        OsTools.runSafe(this, """
          aws --region us-east-1 ec2 create-key-pair --key-name ${keyPairName} \
          | ruby -e "require 'json'; puts JSON.parse(STDIN.read)['KeyMaterial']" > ~/.ssh/${keyPairName}
        """)

        dir('build/target') {
          OsTools.runSafe(this, "tar -zxvf ${archiveName}")
        }

        dir("build/target/cookbooks/${cookbookName}") {
          OsTools.runSafe(this, """
            KEY_PAIR_NAME=${keyPairName} SECURITY_GROUP_ID=${params.security_group_id} SUBNET_ID=${params.subnet_id} \
            erb ${WORKSPACE}/.kitchen.yml.erb > .kitchen.yml
          """)
          OsTools.runSafe(this, 'cp ${WORKSPACE}/Berksfile .')
          OsTools.runSafe(this, 'cp ${WORKSPACE}/Berksfile.lock .')
          OsTools.runSafe(this, 'cp ${WORKSPACE}/metadata.rb .')
          OsTools.runSafe(this, 'kitchen test')
        }
      } finally {
        OsTools.runSafe(this, "aws --region us-east-1 ec2 delete-key-pair --key-name ${keyPairName}")
        OsTools.runSafe(this, "rm -f ~/.ssh/${keyPairName}")
      }

      if (currentBuild.result == 'FAILURE') {
        gitHub.statusUpdate commitId, 'failure', 'test', 'Tests failed'
        return
      } else {
        gitHub.statusUpdate commitId, 'success', 'test', 'Tests succeeded'
      }
    }
    if (currentBuild.result == 'FAILURE') {
      return
    }
    if (params.nexus_rm_version && params.nexus_rm_version_sha || params.oracle_jre_url && params.oracle_jre_sha) {
      stage('Commit RM Version Update') {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'integrations-github-api',
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
          def commitMessage = [
            params.nexus_rm_version && params.nexus_rm_version_sha ?
              "Update Repository Manager to ${params.nexus_rm_version}." : "",
            params.oracle_jre_url && params.oracle_jre_sha ?
              "Update Oracle JRE to ${(params.oracle_jre_url =~ /(\du\d{3}\-b\d{2})/)[0][0]}." : ""
          ].findAll({ it }).join(' ')
          OsTools.runSafe(this, """
            git add ${defaultsFileLocation}
            git commit -m '${commitMessage}'
            git push https://${env.GITHUB_API_USERNAME}:${env.GITHUB_API_PASSWORD}@github.com/${organization}/${repository}.git ${branch}
          """)
        }
      }
    }
    stage('Archive') {
      dir('build/target') {
        archiveArtifacts artifacts: "${archiveName}", onlyIfSuccessful: true
      }
    }
    if (branch != 'master') {
      return
    }
    input 'Push tags?'
    stage('Push tags') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        OsTools.runSafe(this, "git tag \"release-${env.VERSION}\"")
        OsTools.runSafe(this, """
          git push \
          https://${env.GITHUB_API_USERNAME}:${env.GITHUB_API_PASSWORD}@github.com/${organization}/${repository}.git \
            release-${version}
        """)
      }
    }
    stage('Create release') {
      response = httpRequest customHeaders: [[name: 'Authorization', value: "token ${apiToken}"]],
          acceptType: 'APPLICATION_JSON', contentType: 'APPLICATION_JSON', httpMode: 'POST',
          requestBody: "{\"tag_name\": \"release-${env.VERSION}\"}",
          url: "https://api.github.com/repos/${organization}/${repository}/releases"

      def release = readJSON text: response.content
      def releaseId = release.id

      response = OsTools.runSafe(this, """
        curl -H "Authorization: token ${apiToken}" \
             -H "Accept: application/vnd.github.manifold-preview" \
             -H "Content-Type: application/gzip" \
             --data-binary @build/target/${archiveName} \
             "https://uploads.github.com/repos/${organization}/${repository}/releases/${releaseId}/assets?name=${archiveName}"
      """)
    }
  } finally {
    OsTools.runSafe(this, 'git clean -f && git reset --hard origin/master')
  }
}
def readVersion() {
  readFile('version').split('\n')[0]
}
def getGemInstallDirectory() {
  def content = OsTools.runSafe(this, "gem env")
  for (line in content.split('\n')) {
    if (line.startsWith('  - USER INSTALLATION DIRECTORY: ')) {
      return line.substring(33)
    }
  }
  error 'Could not determine user gem install directory.'
}

/*
 * Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
 * Includes the third-party code listed at http://links.sonatype.com/products/nexus/attributions.
 * "Sonatype" is a trademark of Sonatype, Inc.
 */
@Library('zion-pipeline-library')
import com.sonatype.jenkins.pipeline.GitHub
import com.sonatype.jenkins.pipeline.OsTools

node('ubuntu-zion') {
  def commitId, commitDate, version, imageId, apiToken
  def organization = 'sonatype',
      repository = 'chef-nexus-repository-manager',
      credentialsId = 'integrations-github-api',
      archiveName = 'chef-nexus-repository-manager.tar.gz'
  GitHub gitHub

  try {
    stage('Preparation') {
      deleteDir()

      checkout scm

      commitId = OsTools.runSafe(this, 'git rev-parse HEAD')
      commitDate = OsTools.runSafe(this, "git show -s --format=%cd --date=format:%Y%m%d-%H%M%S ${commitId}")

      version = readVersion()

      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        apiToken = env.GITHUB_API_PASSWORD
      }
      gitHub = new GitHub(this, "${organization}/${repository}", apiToken)
    }
    stage('Build') {
      gitHub.statusUpdate commitId, 'pending', 'build', 'Build is running'

      def gemInstallDirectory = getGemInstallDirectory()
      withEnv(["PATH+GEMS=${gemInstallDirectory}/bin"]) {
        OsTools.runSafe(this, "gem install --user-install berkshelf")
        OsTools.runSafe(this, "gem install --user-install test-kitchen")
        OsTools.runSafe(this, "gem install --user-install kitchen-docker")
        OsTools.runSafe(this, "berks package")
        OsTools.runSafe(this, "kitchen --version")
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
    stage('Archive') {
      dir('build/target') {
        OsTools.runSafe(this, "mv ../../cookbooks-*.tar.gz ${archiveName}")
        archiveArtifacts artifacts: "${archiveName}", onlyIfSuccessful: true
      }
    }
    if (scm.branches[0].name != '*/master') {
      return
    }
    input 'Push tags?'
    stage('Push tags') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        OsTools.runSafe(this, "git tag release-${version}")
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
          requestBody: "{\"tag_name\": \"release-${version}\"}",
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

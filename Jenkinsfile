/*
 * Copyright (c) 2017-present Sonatype, Inc. All rights reserved.
 * Includes the third-party code listed at http://links.sonatype.com/products/nexus/attributions.
 * "Sonatype" is a trademark of Sonatype, Inc.
 */
@Library('zion-pipeline-library')
import com.sonatype.jenkins.pipeline.GitHub
import com.sonatype.jenkins.pipeline.OsTools

node('ubuntu-zion') {
  def commitId, commitDate, version, imageId
  def organization = 'sonatype',
      repository = 'chef-nexus-repository-manager',
      credentialsId = 'integrations-github-api',
      archiveName = 'chef-nexus-repository-manager'
  GitHub gitHub

  try {
    stage('Preparation') {
      deleteDir()

      checkout scm

      commitId = OsTools.runSafe(this, 'git rev-parse HEAD')
      commitDate = OsTools.runSafe(this, "git show -s --format=%cd --date=format:%Y%m%d-%H%M%S ${commitId}")

      version = readVersion()

      def apiToken
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        apiToken = env.GITHUB_API_PASSWORD
      }
      gitHub = new GitHub(this, "${organization}/${repository}", apiToken)
    }
    stage('Build') {
      gitHub.statusUpdate commitId, 'pending', 'build', 'Build is running'

      OsTools.runSafe(this, 'curl -L https://www.getchef.com/chef/install.sh | bash')

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
        archiveArtifacts artifacts: "${archiveName}.tar.gz", onlyIfSuccessful: true
      }
    }
    if (scm.branches[0].name != '*/master') {
      return
    }
    input 'Push image and tags?'
    stage('Push image') {
    }
    stage('Push tags') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: credentialsId,
                        usernameVariable: 'GITHUB_API_USERNAME', passwordVariable: 'GITHUB_API_PASSWORD']]) {
        OsTools.runSafe(this, "git tag ${version}")
        OsTools.runSafe(this, """
          git push \
          https://${env.GITHUB_API_USERNAME}:${env.GITHUB_API_PASSWORD}@github.com/${organization}/${repository}.git \
            ${version}
        """)
      }
      OsTools.runSafe(this, "git tag -d ${version}")
    }
  } finally {
    OsTools.runSafe(this, 'git clean -f && git reset --hard origin/master')
  }
}
def readVersion() {
  return '0.3.0-01'
}

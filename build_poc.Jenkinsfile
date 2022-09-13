#!groovy
//package org.jenkinsci.plugins.gitclient

node {
def buildinfo
def git_commit

    stage('source'){
    //cleanWs()
    checkout scm

    git_commit = sh(returnStdout: true, script: 'git rev-parse --short=8 HEAD').trim()
    git_branch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
    echo "The branch name is : ${git_branch}"
    echo "the commit id is : ${git_commit}"
    sh 'sudo chmod 777 /var/lib/jenkins/workspace/TerraformPipeline/myscript.sh'
    
    }

    stage('Terraform init'){
        sh 'terraform init'
        sh 'terraform fmt'
        sh 'terraform validate'
    }

    stage('Terraform Plan'){
        sh 'terraform plan'
    }

    stage('Terraform Apply'){
        sh 'terraform apply -var="buildid=khasim1643" -auto-approve'
    }   
}

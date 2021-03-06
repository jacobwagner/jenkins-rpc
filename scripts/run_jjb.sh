#!/bin/bash

set -e
set -x

. /opt/jenkins/venvs/jjb/bin/activate

set -u

# Read JENKINS_API_KEY
. /opt/jenkins/creds/jjb.creds

pushd rpc-jobs

# Execute JJB
jenkins-jobs \
  --conf jenkins_jobs.ini \
  --password $JENKINS_API_KEY \
  update \
  jobs.yaml


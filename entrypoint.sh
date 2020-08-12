#!/bin/sh -l

echo TESTING CREATE ACTION
echo $GITHUB_WORKSPACE
pwd
ls -la ./
cat README.md

architect login -u $INPUT_ARCHITECT_USERNAME -p $INPUT_ARCHITECT_PASSWORD
# TODO: echo steps
architect register --tag $INPUT_ARCHITECT_ENVIRONMENT_NAME ./architect.yml # TODO: install docker
# TODO: keep using same name as tag and environment
architect environment:create $INPUT_ARCHITECT_ENVIRONMENT_NAME -a $INPUT_ARCHITECT_ACCOUNT --platform $INPUT_ARCHITECT_PLATFORM

echo $INPUT_ARCHITECT_ENVIRONMENT_CONFIG > environment.yml

architect deploy --auto_approve -a $INPUT_ARCHITECT_ACCOUNT -e $INPUT_ARCHITECT_ENVIRONMENT_NAME environment.yml

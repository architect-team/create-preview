#!/bin/sh -l

echo TESTING CREATE ACTION
echo $GITHUB_WORKSPACE
$GITHUB_WORKSPACE ls -la

architect login -u $ARCHITECT_USERNAME -p $ARCHITECT_PASSWORD

architect register --tag $ARCHITECT_ENVIRONMENT_NAME ./architect.yml

architect environment:create $ARCHITECT_ENVIRONMENT_NAME -a $ARCHITECT_ACCOUNT --platform $ARCHITECT_PLATFORM

echo $ARCHITECT_ENVIRONMENT_CONFIG > environment.yml

architect deploy --auto_approve -a $ARCHITECT_ACCOUNT -e $ARCHITECT_ENVIRONMENT_NAME environment.yml

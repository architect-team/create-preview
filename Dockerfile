FROM node-alpine:12.18.3

RUN npm install -g @architect-io/cli && architect version

RUN echo TESTING CREATE ACTION
RUN echo $GITHUB_WORKSPACE
RUN echo $GITHUB_WORKSPACE ls -la

RUN architect login -u $ARCHITECT_USERNAME -p $ARCHITECT_PASSWORD

RUN architect register --tag $ARCHITECT_ENVIRONMENT_NAME ./architect.yml

RUN architect environment:create $ARCHITECT_ENVIRONMENT_NAME -a $ARCHITECT_ACCOUNT --platform $ARCHITECT_PLATFORM

RUN echo $ARCHITECT_ENVIRONMENT_CONFIG > environment.yml

RUN architect deploy --auto_approve -a $ARCHITECT_ACCOUNT -e $ARCHITECT_ENVIRONMENT_NAME environment.yml

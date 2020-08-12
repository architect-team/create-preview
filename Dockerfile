FROM node-alpine:12.18.3

RUN npm install -g @architect-io/cli

RUN echo TESTING CREATE ACTION
# jobs:
#   architect:
#     runs-on: ubuntu-latest
#     steps:
#       - uses: actions/checkout@v2
#       - name: format environment name
#         run: ::set-env name=ARCHITECT_ENVIRONMENT::"${$GITHUB_REF//\//-}"
#       - name: login
#         run: architect login -u $ARCHITECT_USERNAME -p $ARCHITECT_PASSWORD
#       - name: register branch-tagged component
#         run: architect register --tag $ARCHITECT_ENVIRONMENT ./architect.yml
#       - name: create environment
#         run: architect environment:create $ARCHITECT_ENVIRONMENT -a $ARCHITECT_ACCOUNT --platform $ARCHITECT_PLATFORM
#       - name: deploy preview
#         run: |
#           architect deploy \
#             --account $ARCHITECT_ACCOUNT
#             --environment $ARCHITECT_ENVIRONMENT \
#             --auto_approve \
#             ./environment.yml

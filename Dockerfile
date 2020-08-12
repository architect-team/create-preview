FROM node:12-alpine

RUN apk add python3

RUN npm install -g @architect-io/cli && architect version

ENTRYPOINT [ "entrypoint.sh" ]

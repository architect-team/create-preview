FROM node:12-alpine

RUN apk add python3

RUN npm install -g @architect-io/cli && architect version

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

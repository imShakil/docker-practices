FROM node:18-alpine

WORKDIR /epicbook

COPY ./epicbook-app .
COPY config-template.json /tmp/config-template.json

RUN apk add --no-cache gettext
RUN npm install

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "/epicbook/entrypoint.sh" ]
CMD ["node", "/epicbook/server.js"]

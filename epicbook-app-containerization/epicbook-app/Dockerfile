FROM node:18-alpine

WORKDIR /epicbook

COPY . .
COPY ../config-template.json /tmp/config-template.json

RUN apk add --no-cache gettext
RUN npm install

EXPOSE 3000

ENTRYPOINT [ "sh", "-c", "envsubst < /tmp/config-template.json > /app/config/config.json" ]

CMD ["node", "/app/server.js"]

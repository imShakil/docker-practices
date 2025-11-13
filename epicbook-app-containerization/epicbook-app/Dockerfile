FROM node:18-alpine

WORKDIR /epicbook

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000


CMD ["node", "/app/server.js"]

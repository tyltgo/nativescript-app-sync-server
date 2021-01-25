FROM node:14

ENV TZ America/New_York

WORKDIR /app

RUN npm i -g pm2

COPY package.json .
COPY package-lock.json .
RUN npm install
RUN npm prune

COPY . .

CMD ["pm2", "start", "process.json"]

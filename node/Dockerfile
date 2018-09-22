FROM resin/raspberrypi3-alpine-node:8-slim

WORKDIR /usr/src/app

COPY package.json package.json

RUN JOBS=MAX npm install --production --unsafe-perm && rm -rf /tmp/*
COPY . ./

ENV INITSYSTEM on

CMD ["npm", "start"]

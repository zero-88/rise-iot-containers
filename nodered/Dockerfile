FROM resin/raspberrypi3-alpine-node:latest

WORKDIR /usr/src/node-red

RUN adduser -h /usr/src/node-red -D -H red

COPY src/* ./

RUN npm install \
    && mkdir -p data \
    && chown -R red:red ./ \
    && chmod o+w ./ \
    && chmod a+x start.sh

USER red

ENV FLOWS="flows.json" LOG_LEVEL="info" \
    NODE_PATH="/usr/src/node-red/node_modules:/data/node_modules" \
    ADMIN_USER="admin" ADMIN_PWD="" \
    INITSYSTEM="on"

EXPOSE 1880
VOLUME ["/usr/src/node-red/data"]

ENTRYPOINT [ "./start.sh" ]

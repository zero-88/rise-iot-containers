FROM resin/raspberrypi3-alpine-node:8

WORKDIR /usr/src/node-red

RUN adduser -D red

COPY src/* ./

RUN npm install \
    && mkdir -p data \
    && chown -R red:red ./ \
    && chmod o+w ./ \
    && chmod a+x start.sh

USER red

ENV LOG_LEVEL="info" \
    NODE_PATH="/usr/src/node-red/node_modules:/data/node_modules" \
    NODE_RED_USER="admin" NODE_RED_PASSWORD="" \
    INITSYSTEM="on"

EXPOSE 1880
VOLUME ["/usr/src/node-red/data"]

ENTRYPOINT [ "./start.sh" ]

#!/bin/sh
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
export RISE_HOST=$RESIN_SUPERVISOR_HOST

[[ -z $NODE_RED_USER ]] && { echo "Missing required user"; exit 1; }
if [[ -z $NODE_RED_PASSWORD ]] ; then
    [[ -z $NODE_RED_PLAIN_PASSWORD ]] && { echo "Missing required password"; exit 2; }
    export NODE_RED_PASSWORD=`node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" $NODE_RED_PLAIN_PASSWORD`
    echo $NODE_RED_PASSWORD
fi

mkdir -p /data/lib/flows/
cp -rf ./flows/*.json /data/lib/flows/

npm start -- --userDir /data -s settings.js

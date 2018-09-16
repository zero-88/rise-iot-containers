#!/bin/sh

[[ -z $NODE_RED_USER ]] && { echo "Missing required user"; exit 1; }
if [[ -z $NODE_RED_PASSWORD ]] ; then
    [[ -z $NODE_RED_PLAIN_PASSWORD ]] && { echo "Missing required password"; exit 2; }
    export NODE_RED_PASSWORD=`node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" $NODE_RED_PLAIN_PASSWORD`
    echo $NODE_RED_PASSWORD
fi

npm start -- --userDir /data
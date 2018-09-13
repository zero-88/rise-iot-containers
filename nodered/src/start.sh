#!/bin/sh
echo $NODE_RED_USER
echo $NODE_RED_PASSWORD
echo $ADMIN_USER
echo $ADMIN_PWD
[[ -z $ADMIN_USER ]] && { echo "Missing required user"; exit 1; }
if [[ -z $ADMIN_PWD ]] ; then
    if [[ -n $NODE_RED_PASSWORD ]]; then
        export ADMIN_PWD=`node -e "console.log(require('bcryptjs').hashSync(process.argv[1], 8));" $NODE_RED_PASSWORD`
        echo $ADMIN_PWD
    else
        echo "Missing required password"
        exit 1;
    fi
fi
npm start -- --userDir ./data

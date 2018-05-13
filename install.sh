#!/bin/bash

echo "============================="
echo "WIKI.JS - HEROKU INSTALLATION"
echo "============================="

VERSION=$(curl -L -s -S https://beta.requarks.io/api/version/stable)

echo "-> Copying private key..."
mkdir ./.ssh
chmod 700 ./.ssh
<<<<<<< HEAD
echo $WIKI_GIT_PRIVATE_KEY > ./.ssh/git.pem
=======
echo $WIKI_GIT_PRIVATE_KEY | awk '{gsub(/\\n/,"\n")}1' > ./.ssh/git.pem
>>>>>>> master
chmod 400 ./.ssh/git.pem

echo "-> Fetching latest build..."
curl -L -s -S https://github.com/Requarks/wiki/releases/download/v$VERSION/wiki-js.tar.gz | tar xz -C ./wiki

echo "-> Fetching dependencies..."
curl -L -s -S https://github.com/Requarks/wiki/releases/download/v$VERSION/node_modules.tar.gz | tar xz -C ./wiki

echo "-> Installation Complete"

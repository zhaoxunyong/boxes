#!/bin/bash

export http_proxy=http://192.168.102.82:1082
export https_proxy=http://192.168.102.82:1082
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
. ~/.bashrc


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#nvm install v12.22.6
nvm install v14.19.3
npm config set registry https://registry.npmmirror.com --global
npm config set disturl https://npmmirror.com/dist --global

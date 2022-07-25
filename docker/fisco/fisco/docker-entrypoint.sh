#!/bin/bash

/data/shell/changepwd.sh
rm -fr /data/shell/changpwd.sh
#For fisco
cd ~/fisco && bash nodes/127.0.0.1/start_all.sh

# run the command given as arguments from CMD
exec "$@"

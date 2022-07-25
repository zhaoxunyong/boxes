#!/bin/bash

/data/shell/changepwd.sh
rm -fr /data/shell/changpwd.sh

# run the command given as arguments from CMD
exec "$@"

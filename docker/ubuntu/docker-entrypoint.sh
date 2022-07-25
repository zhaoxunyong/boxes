#!/bin/bash

/data/shell/changepwd.sh && rm -fr /data/shell/changepwd.sh

# run the command given as arguments from CMD
exec "$@"

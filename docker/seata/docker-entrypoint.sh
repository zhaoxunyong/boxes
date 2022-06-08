#!/bin/bash

/data/shell/changepwd.sh && rm -fr /data/shell/changpwd.sh

su - mysql -c "/Developer/mysql-5.7.37/bin/mysqld_safe --defaults-file=/etc/my.cnf &"
# run the command given as arguments from CMD
exec "$@"

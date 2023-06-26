#!/usr/bin/expect
set timeout -1
set PWD "Aa123#@!"
spawn passwd 
expect "New password:" 
send "$PWD\r"
expect "Retype new password:"
send "$PWD\r"
interact
#expect eof

#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ ! -d "/var/lib/mysql/mysql" ]; then
	exec $@# Execute the command with the extracted arguments
else
	# Extract all arguments except the last one
	args="${@:1:$#-1}"
	exec $args
fi

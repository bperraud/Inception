#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/mysql" ]; then
	shift $(( $# - 1 ))

exec $@


#else
	# Extract all arguments except the last one
	#args="${@:1:$#-1}"
	# Execute the command with the extracted arguments
	#exec $args
#fi

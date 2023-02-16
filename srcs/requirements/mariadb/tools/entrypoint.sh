#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/my_database" ]; then
	#set -- "${@:1:$(($#-1))}"
	exec "${@:0:$#}"
else
	exec "$@"
fi


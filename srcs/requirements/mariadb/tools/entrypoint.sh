#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/my_database" ]; then
	echo "$@"
	echo "$1"
	exec "$@"
else
	exec "$@"
fi

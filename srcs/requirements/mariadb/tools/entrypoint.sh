#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/my_database" ]; then
	while [ $# -gt 1 ]; do
		shift
	done
fi
echo "$@"
exec "$@"

#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/my_database" ]; then
	set -- "${@:1:$((args-1))}"
fi
echo "$@"
exec "$@"

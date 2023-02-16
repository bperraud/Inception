#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql

if [ -d "/var/lib/mysql/my_database" ]; then
	#exec $0 $1 $2
	exec $@
else
	exec $@
fi

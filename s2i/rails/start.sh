#!/bin/bash
set -e
echo "Starting rails entrypoint:\n"
case "$1" in
        rails|rake|sidekiq|puma)
        source /migrate-database.sh
        command="bundle exec $@";;
        *)
        command="$@";;
esac
exec ${command}

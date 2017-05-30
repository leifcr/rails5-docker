#!/bin/bash
set -e
case "$1" in
        rails|rake|sidekiq|puma)
        source /migrate-database.sh
        echo
        echo "== Starting $1 with bundle exec"
        echo
        command="bundle exec $@";;
        *)
        command="$@";;
esac
exec ${command}

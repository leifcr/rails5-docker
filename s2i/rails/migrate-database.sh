#!/bin/bash
set +e
echo
echo "== Migrating database"
echo
bundle exec rails db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  set -e
  bundle exec rails db:setup && bundle exec rails db:migrate
fi

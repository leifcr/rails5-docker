#!/bin/sh
cp -f Gemfile* ./dev/
cp -f Gemfile* ./no-entry-point/
cp -f Gemfile* ./with_ssh_agent/
# gc -m "Update gems"

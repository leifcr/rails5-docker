#!/bin/sh
bundle install && yarn install
cp Gemfile ./dev
cp Gemfile.lock ./dev
cp yarn.lock ./dev
cp package.json ./dev
git commit -a -m 'Update gems and yarn'

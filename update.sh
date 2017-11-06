#!/bin/sh
cp package.json dev/
cp package.json s2i/
cp package.json s2i-passenger/
cp package.json s2i-passenger-standalone/
cp yarn.lock dev/
cp yarn.lock s2i/
cp yarn.lock s2i-passenger/
cp yarn.lock s2i-passenger-standalone/
cp Gemfile* dev/
cp Gemfile* s2i/
cp Gemfile* s2i-passenger/
cp Gemfile* s2i-passenger-standalone/
git commit -a -m 'Update gems and yarn'

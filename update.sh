#!/bin/sh
cp Gemfile* s2i/
cp Gemfile* s2i-passenger/
cp Gemfile* s2i-passenger-standalone/
git commit -a -m 'Update gems'

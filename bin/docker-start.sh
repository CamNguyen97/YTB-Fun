#!/bin/sh

if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi
mkdir -p tmp/pids && mkdir -p tmp/sockets

bundle check || bundle install
rails db:create db:migrate
yarn install --check-files
rails assets:precompile
if [ "$RAILS_ENV" = "production" -o "$RAILS_ENV" = "staging" ]; then
    RAILS_ENV=$RAILS_ENV bundle exec puma -C config/puma.rb
else
    rake db:seed
    bundle exec rails s -b 0.0.0.0
fi
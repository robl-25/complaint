#! /bin/bash

docker-compose run -e "RAILS_ENV=test" web rails db:create
docker-compose run -e "RAILS_ENV=test" web bundle exec rspec spec

#! /bin/bash

docker-compose run -e "RAILS_ENV=test" web rails db:create db:migrate
docker-compose run -e "RAILS_ENV=test" web bundle exec rspec spec

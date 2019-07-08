#! /bin/bash

docker-compose build
docker-compose run web bundle install
docker-compose run web rails db:create db:migrate
docker-compose run web rails db:seed
docker-compose up

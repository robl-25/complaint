#! /bin/bash

docker-compose build
docker-compose run web bundle install
docker-compose run web rails db:create
docker-compose up

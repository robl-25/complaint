# Complaint

You can run this project with docker-compose or not.

## With docker-compose

Install [docker](https://docs.docker.com/install/)
 and [docker-compose](https://docs.docker.com/compose/install/).
Than run `./development.sh`. The application will be available
in `localhost:3000`.

## Without docker-compose

Install [ruby](https://www.ruby-lang.org/en/documentation/installation/)
version 2.5. Than install
[mongodb](https://docs.mongodb.com/manual/installation/)
 version 4.0 and `nodejs`.
Than install `bundle` version 1.17.1 by running
`gem install bundler -v 1.17`.
After that, run `bundle install` to install project gems.
Create your database with `rails db:create`. With this, you just need run
`rails s` and the application will be available in `localhost:3000`.

## Tests

If you have docker and docker-compose in your machine you can simply run
`./test.sh`. If you don't have, run
`RAILS_ENV=test rails db:create` to create test database. Than you just run
`rspec spec`.

## Deploy

For this project I used [Heroku](https://cloud.mongodb.com)
and [Mongo Atlas](https://cloud.mongodb.com).

- Mongo Atlas

  - Create new project for this project database.
  - Build new Cluster (I used AWS as provider, on us-east-1).
  - Create a new database called `complaint_production`.
  - Use the `Connect` tab to find database uri.
  - Allow access to your production application.


- Heroku

  - Create a new app for this project.
  - On the `Deploy` tab, add github integration with this repository.
  - With `Heroku Cli`, set the stack of the application to `container` with
  `heroku stack:set container`.
  - On the `Settings` tab, set `DATABASE_URI` to the value from Mongo
  Atlas and `RAILS_ENV` as `production` and set a `SECRET_KEY_BASE`.
  - Than use `Deploy Branch` on the `Deploy` tab to deploy any branch or
  enable `Automatic Deploy`.

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

[Fleet Management System API Documentation](/ApiDocs.md)

## How to Start

### Local development

- you must have postgres installed on your computer
- you must have ruby installed on your computer

1. Clone the repository
2. Run `bundle install`
3. add your local db credentials to database.yml
4. Run `rails db:create`
5. Run `rails db:migrate`
6. Run `rails db:seed`
7. Run `rails s` to start the server
8. Open http://localhost:3000 in your browser

> if you have an issue with postgres please go to this commit [sqlite-setup](https://github.com/EslamKhalaf9/fleet-management-system/commit/4bf4f42d91bcfe69f752b687c91a8fd57fef2fd8) where I use sqlite

### Docker

side notes:
- All of the containers are running without issues (api, postgres) but didn't manage to access it through my host machine (localhost:3000 | 172.0.0.0:3000), still figuring it out

1. create `.env` file 
2. but these credentials
```bash
# RAILS_ENV=production
RAILS_ENV=development
POSTGRES_HOST=db
POSTGRES_DB=fleet_management_system_production
POSTGRES_USER=admin
POSTGRES_PASSWORD=password
RAILS_MASTER_KEY=master_key
```
3. update `database.yml` file 
```ruby
# config/database.yml 
production:
  <<: *default
  host: <%= ENV.fetch("POSTGRES_HOST") %>
  database: <%= ENV.fetch("POSTGRES_DB") %>
  username: <%= ENV.fetch("POSTGRES_USER") %>
  password: <%= ENV.fetch("POSTGRES_PASSWORD") %>
```

3. Run `docker-compose build`
4. Run `docker-compose up`
5. Open http://localhost:3000 in your browser

### Unit Tests using Rspec

1. Run `rspec`

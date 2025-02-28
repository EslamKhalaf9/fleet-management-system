# Fleat Management System
* Ruby version `ruby-3.3.4`

## API Documentation

[Fleet Management System API Documentation](/ApiDocs.md)

[postman collection](https://drive.google.com/file/d/1DBzKt3MrpMPnWLzQUAQE6jJyWk8zO_3K/view?usp=sharing)

### Database Schema
![Database Schema](FMS_Schema.png "Title")

### How Scalability is achieved
- System admins can add as many trips as they want
- System admins can add as many stations as they want
- they can change the station order in a single trip without affecting other trips
- each trip has his own available seats

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

> > if you have an issue with postgres please switch to this branch as it uses sqlite [sqlite-version](https://github.com/EslamKhalaf9/fleet-management-system/tree/sqlite-version)

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

### Test User data
```bash
username = "admin"
email = "admin@mail.com"
password = "123456789"
```
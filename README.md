# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version ruby-2.7.1, rails 6.0.3.3

* System dependencies postgresql redis

* Configuration

* Database creation: docker-compose run web rails g db:create

* Database migration: docker-compose run web rails g db:migrate

* Update Yarn packages docker-compose run web yarn install --check-files

* Test cases docker-compose run web rails test

* Services: job queues, cache servers

* Create RoR project with a route /contact or /. All routes should redirect to this page or handle 404.

* Use Restful routing approach to implement an endpoint that accepts form submission, saves to DB & sends an email to ENV["ADMIN_EMAIL"]

* Add support for two languages. You can add a simple language selector anywhere in UI.

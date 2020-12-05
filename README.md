README.md
## Jungle
A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Setup
Run bundle install to install dependencies
Create config/database.yml by copying config/database.example.yml
Create config/secrets.yml by copying config/secrets.example.yml
Run bin/rake db:reset to create, load and seed db
Create .env file based on .env.example
Sign up for a Stripe account
Put Stripe (test) keys into appropriate .env vars
Run bin/rails s -b 0.0.0.0 to start the server
Stripe Testing
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Can also use Card# 4242 4242 4242 4242 with any date in future & security #

More information in their docs: https://stripe.com/docs/testing#cards

## Dependencies
Rails 4.2 Rails Guide
PostgreSQL 9.x
Stripe
Testing
rspec
Capybara
Poltergeist
Screenshots
"Products_page"
"Order_page"
"Order-Sucess_page"

## Models

### The following models can be found in app/models

users
categories
products
orders
line_items
Controllers

### The following controllers can be found in app/controllers

about
carts
categories
orders
products
sessions
users

### The following admin controllers can be found in app/controllers/admin

categories
dashboard
products

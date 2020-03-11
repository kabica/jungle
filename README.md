# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Jungle allows users to browse through a database of goods available for purchase. These goods are categorzied and users can further refine their selection accordingly. Dynamic alerts appear to inform users of currently active sales, the price of each product and an alert badge when an item is sold out. 

Additionally, there is login authentication for new and returning users + authentication for administartive access (ie. creating new categories and populating them with products of your choosing!)

<p align="center">
    <img src="https://github.com/kabica/jungle/blob/master/app/assets/images/Screen%20Shot%202020-03-11%20at%202.40.06%20PM.png?raw=true" alt="Logo">
    <img src="https://github.com/kabica/jungle/blob/master/app/assets/images/Screen%20Shot%202020-03-11%20at%202.05.28%20PM.png?raw=true" alt="Logo">
    <img src="https://github.com/kabica/jungle/blob/master/app/assets/images/Screen%20Shot%202020-03-11%20at%202.40.50%20PM.png?raw=true" alt="Logo">
    <img src="https://github.com/kabica/jungle/blob/master/app/assets/images/Screen%20Shot%202020-03-11%20at%202.49.22%20PM.png?raw=true" alt="Logo">
 
    
</p>


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

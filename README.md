# README

## Payout Management

This project is to calculate the disbursement amount for the merchant. Once the merchant sell some item from their shop. Once the itme is sold the merchant will mark that order to completed. So once the order is completed the certain amount from the order amount will be charged as per the order amount and remaining amount will be disburse to the merchant. This system will list the merchants with the amount to be disburse.

## Local Setup

1. Install [RVM](https://rvm.io/rvm/install)
2.  Install ruby 2.7.5 using rvm
 ```
  rvm install 2.7.5
```
3. Clone this repository
4. Inside the project folder Install bundler
```
  gem install bundler
```
4. Install gems with bundler
```
  bundle install
```
5. Install postgresql
```
brew install postgresql
```
6. Install redis
  ```
    brew install redis
  ```
7. create database
```
  rails db:create db:migrate
```
8. Start the server process
```
  rails server
```
9. Start the background job processor
```
  sidekiq
```
10. Start redis server
```
  redis-server
```
11. To run spec
  ```
    rspec
  ```
## API Endpoint

1. List all merchants with disburse amount for the running week
```
  http://localhost:3000/api/v1/merchant_disbursements
```
2. List only the specific merchant with its disbursement amount for the running week
```
  http://localhost:3000/api/v1/merchant_disbursements?merchant_id=id
```


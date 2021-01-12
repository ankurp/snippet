# Get Started

## Requirements
* Install ruby v3.0.0. You can install that directly or using `rvm`
* Then install bundler using `gem install bundler`
* Clone this repo and run the commands inside the repo to get started

## Steps to run locally
* Run `bundle` command to install server side dependencies
* Run `rails db:create && rails db:migrate`
* Run `rails s` to start all processes
* API server is running at host and port http://localhost:3000

## Sample API request

```
curl -X POST -H "Content-Type: application/json" -d '{"name":"recipe", "expires_in": 30, "snippet":"1 apple"}' http://localhost:3000/snippets

curl http://localhost:3000/snippets/recipe

curl -X POST -H "Content-Type: application/json" -d '{"name":"recipe", "expires_in":30, "snippet":"1 apple", "password":"1234"}' http://localhost:3000/snippets

curl -X PUT -H "Content-Type: application/json" -d '{"password":"1234", "snippet":"40 grapes"}' http://localhost:3000/snippets/recipe

curl -X POST http://localhost:3000/snippets/recipe/like
```
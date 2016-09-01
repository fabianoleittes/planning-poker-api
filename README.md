# Planning Poker API

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local


### API

### What's included

### Features

What's in Version V1

- [x] RESTful API
- [x] JSON Schema implementation
- [x] API versioning
- [x] RSpec testing
- [x] Setup scripts
- [x] Usage of http methods/verbs
- [x] Structured endpoints
- [x] Return appropriate status code
- [x] Create users
- [x] Create backlogs
- [x] Create stories
- [x] Create score

### Application gems:
* [Puma](https://github.com/puma/puma) as rails web server.
* [Rack CORS](https://github.com/cyu/rack-cors) for [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing).
* [POW](http://pow.cx/) for subdomain.


### Development gems
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner.
* [Bundler Audit](https://github.com/rubysec/bundler-audit) Patch-level verification for Gems.
* [Spring](https://github.com/rails/spring) for fast Rails actions via pre-loading.



### Testing gems

* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data.
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing.
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers.


### Scripts

* `bin/setup` - Setup required gems and migrate db if needed.
* `bin/quality` - Runs rubocop, brakeman, and bundle-audit for the app.
* `bin/ci` - Should be used in the CI or locally.
* `bin/rspec` - To run testing.

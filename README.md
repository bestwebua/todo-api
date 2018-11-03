# Todo API
[![Maintainability](https://api.codeclimate.com/v1/badges/f571db91e53dc3bf63b3/maintainability)](https://codeclimate.com/github/bestwebua/todo-api/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/f571db91e53dc3bf63b3/test_coverage)](https://codeclimate.com/github/bestwebua/todo-api/test_coverage) [![Build Status](https://travis-ci.org/bestwebua/todo-api.svg?branch=feature%2Fbase_version)](https://travis-ci.org/bestwebua/todo-api)

Simple Todo RESTful JSON API with documentation. Implemented with Rails 5.2, demo: http://todo-api-restful.herokuapp.com

## Features
1. Token based authentication with JWT and own microservices, sign out possibility
2. Thin controllers with Rails exception handler
3. Read-only Active Record mode for completed tasks
4. Task prioritization
5. Image upload for comment via Active Storage, comment img-src attribute
6. Smart API versionization with default version, accepts version in headers
7. Serialized API output
8. API documentation, accepts version in headers
9. Minimal gem set
10. 100% RSpec test coverage

For rebuild current api doc just use:
```bash
rails api:v1:docs
```

## Technology summary

* Ruby 2.5.0
* Rails 5.2.1, bcrypt, jwt, active storage, acts_as_list
* Documentation: Dox, Aglio
* Testing: RSpec 3.8, rspec-rails 3.8.1, simplecov 0.16.1, RspecFileChef 0.1.2, factory_bot_rails, shoulda-matchers, faker, database_cleaner

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bestwebua/todo-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

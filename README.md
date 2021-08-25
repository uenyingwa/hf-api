# Hf-Api

A Ruby gem for easy integration of Hypofriend API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hf-api', git: 'https://github.com/uenyingwa/hf-api', branch: 'main'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hf-api

## Usage

### Instantiate Offer Object
```ruby
offer = Hf::Api.new
```

### Get Offer
```ruby
offer.new_offer(loan_amount: 350000, property_value: 350000, repayment: 1.0, years_fixed: 15)
```

If response is unsuccessful, a `Hf::Api::OfferError` error is thrown.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/uenyingwa/hf-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/uenyingwa/hf-api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# ErlangConfigParser

ErlangConfigParser can parse Erlang configs to Ruby objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'erlang_config_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install erlang_config_parser

## Usage

```ruby
require "erlang_config_parser"

configs = ErlangConfigParser.parse(erlang_config_string)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This is a fork of https://github.com/nownabe/erlang_config_parser for my own usage.
Bug reports and pull requests are welcome on GitHub at https://github.com/elrisco/erlang_config_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Links

* https://erlang.org/doc/reference_manual/expressions.html#bit_syntax
* https://erlang.org/doc/programming_examples/bit_syntax.html#constructing-binaries-and-bitstrings
* https://erlang.org/documentation/doc-12.1/doc/reference_manual/data_types.html#bit-strings-and-binaries


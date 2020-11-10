[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/joel/homebrew-password)

![Ruby](https://github.com/joel/homebrew-password/workflows/Ruby/badge.svg)

# Password

A simple password generator UI for Passgen.

This can generate for you new password

    password --generate --no-symbol --length=10

Note: For all actions, the result is stored into the current clipboard to make easy copy-pasting

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'password'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install password

Install in the system

    brew tap joel/password
    brew install password

## Usage

```shell
bin/password

Usage: Password [options]

Specific options:
    -l, --length LENGTH              [OPTIONAL] Password length
        --[no-]verbose               Run verbosely
    -c, --[no-]clipboard             Get the content from the clipboard
    -v, --[no-]generate              Generate password
    -s, --[no-]show                  Show the password in the current browser
    -i, --[no-]symbols               Do not include symbols

Common options:
    -h, --help                       Show this message
        --version                    Show version
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/password. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/password/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Password project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/password/blob/master/CODE_OF_CONDUCT.md).

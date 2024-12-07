# Wallhavened

Small Ruby exe/library to help you download all of yours favorite wallpapers from wallhaven.cc

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add wallhavened
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install wallhavened
```

## Usage

```
wallhavened commands:
  wallhavened download_all_collections USERNAME API_KEY DIRECTORY  # Download wallpapers from all user collections
  wallhavened download_collection USERNAME API_KEY DIRECTORY       # Download wallpapers from a user collection
  wallhavened help [COMMAND]                                       # Describe available commands or one specific command
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
For linting use `rake standard`

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/micielski/wallhavened.

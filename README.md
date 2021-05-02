# FantasyIdentifiable

This gem allows you to create unique readable fantasy names as identifiers for your active record objects.

You can also define multiple identifier columns and alternatively use a UUID or friendly_token as identifier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fantasy_identifiable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fantasy_identifiable

## Usage

Make sure your ActiveRecord Model has a string field that you want to use as an identifier.

### Examples

Here you can see the db schema and model definitions for multiple usage examples.

**DB Schema:**

```ruby
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :fantasy_objects, force: true do |t|
    t.string :identifier
  end

  create_table :friendly_objects, force: true do |t|
    t.string :identifier
  end

  create_table :uuid_objects, force: true do |t|
    t.string :identifier
  end

  create_table :multi_objects, force: true do |t|
    t.string :identifier
    t.string :friendly_name
  end
end
```

**ActiveRecord Models**

```ruby
class FantasyObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :fantasy })
end

class FriendlyObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :friendly })
end

class UuidObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({ identifier: :uuid })
end

class MultiObject < ActiveRecord::Base
  include FantasyIdentifiable
  identifiable({
    friendly_name: :friendly,
    identifier: :uuid
  })
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arusa/fantasy_identifiable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FantasyIdentifiable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arusa/fantasy_identifiable/blob/master/CODE_OF_CONDUCT.md).

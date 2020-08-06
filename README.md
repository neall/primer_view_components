<p align="center">
  <img width="300px" src="/static/assets/readme-components.png">
</p>

<h1 align="center">Primer ViewComponents</h1>

<p align="center">ViewComponents for the Primer Design System</p>

## Installation

In `Gemfile`, add:

```ruby
gem "primer_view_components"
```

In `config/application.rb`, add **after the application definition**

```ruby
require "primer/view_components/engine"
```

## Storybook

To run storybook:

```bash
cd test/demo
bundle exec rake view_component_storybook:write_stories_json

bin/rails s
yarn storybook
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/primer/view_components. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
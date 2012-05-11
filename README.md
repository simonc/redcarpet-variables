# Variables for Redcarpet

You have an app that uses Redcarpet to provide Markdown content and you need to
be able to use variables coming from the database or an API or any other data
source, Variables for Redcarpet is the way to go.

## Installation

Add this line to your application's Gemfile:

    gem 'redcarpet-variables'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redcarpet-variables

## Usage

### Variables

Place the variables you want to use inside the Markdown text using the
`${variable_name}` syntax:

``` markdown
The key1 variable as the value ${key1}
```

### The Data Source

The Data Source is the entity that provides the value corresponding to each key.

You can use a simple `Hash`:

``` ruby
data_source = { 'key1' => 'value1', 'key2' => 'value2' }
```

Or the `Api` data source that will fetch response from a remote API:

``` ruby
data_source = Redcarpet::Variables::DataSource::Api.new({
  # %{key} will be replace with the variable key
  url: 'http://example.com/api/variables/%{key}.json'
})
```

(Read more about the `Api` data source in the wiki:
[The Api data source](https://github.com/simonc/redcarpet-variables/wiki/the-api-data-source))

Or even create your own data source, the only thing you need is the fetch
method:

``` ruby
class MyDataSource < Redcarpet::Variables::DataSource::Base
  def fetch(key)
    # get the value for key
  end
end
```

### Use it with Redcarpet

To use Variables with Redcarpet you need to use the `VariablesRenderer` which
inherits from `Redcarpet::Render::HTML`:

``` ruby
rndr = Redcarpet::Variables::VariablesRenderer.new({
  data_source: { 'key1' => 'value1', 'key2' => 'value2' }
})

markdown = Redcarpet::Markdown.new(rndr)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

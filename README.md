# corepro-sdk-ruby

A Ruby SDK for consuming the CorePro API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'corepro'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install corepro

## Usage

Use this object hierarchy as a simple entry point into CorePro.  Details of the CorePro API itself are available at
https://docs.corepro.io/api.  To see all available SDKs, visit https://docs.corepro.io/sdk.

```ruby
require 'corepro'

# create a connection 
# (typical use case is to pull connection info from config.yml, this is for explicitness)
conn = CorePro::Connection.new 'your-api-key-here', 'your-api-secret-here', 'api.corepro.io'

# retrieve a customer by a known tag (pass conn as nil if connection info is in config.yml)
cust = CorePro::Customer.getByTag 'bweaver', conn

# retrieve most recent transactions for that customer's primary account
trans = CorePro::Transaction.list cust.customerId, cust.accounts[0].accountId

```

## Contributing

1. Fork it ( https://github.com/socialmoney/corepro-sdk-ruby/fork ) 
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

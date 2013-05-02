# NCD
Ruby gem for calculating Normalized Compression Distance (NCD).

It's inspired by [RubyForge code snippet](http://rubyforge.org/snippet/detail.php?type=snippet&id=3).

## Installation

Add this line to your application's Gemfile:

    gem 'ncd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ncd

## Usage
```ruby
    require 'ncd'

    a = File.read('somefile.a')
    b = File.read('somefile.b')
    distance = NCD.distance(a, b)
    # or 
    distance = a.ncd(b)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


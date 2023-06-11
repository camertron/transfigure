## transfigure

An experimental Ruby native extension that allows changing an object's class at runtime.

## Installation

`gem install transfigure`

## Usage

```ruby
require 'transfigure'
```

The transfigure gem adds the `transfigure_into!` method onto Ruby's `Object` class. Pass it another class to switch out the object's current class to another one:

```ruby
class Foo
end

class Bar
end

obj = Foo.new
obj.is_a?(Foo) # => true
obj.transfigure_into!(Bar)
obj.is_a?(Foo) # => false
obj.is_a?(Bar) # => true
```

## Requirements

The code has only been tested on MRI (cruby) 3.1 and will definitely not work on other Ruby engines like JRuby or TruffleRuby.

## Running Tests

`bundle exec rspec`

## Authors

* Cameron C. Dutro: http://github.com/camertron

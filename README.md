# BounceTouchIcon

Rack middleware to 404 touch icon requests from iOS devices.
These include requests like:

* /apple-touch-icon.png
* /apple-touch-icon-120x120.png
* /apple-touch-icon-precomposed.png
* /apple-touch-icon-120x120-precomposed.png

If you don't have these, you are probably already 404ing, so why not
404 before it hits your main app?

## Installation

Add this line to your application's Gemfile:

    gem 'bounce_touch_icon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bounce_touch_icon

## Usage

Inject into your rack middleware accordingly:

```
use BounceTouchIcon::Middleware
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

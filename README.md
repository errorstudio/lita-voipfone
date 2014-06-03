# lita-voipfone

lita-voipfone is a handler for http://lita.io to integrate with your http://www.voipfone.co.uk account.

It uses the voipfone_client gem, and you'll need a Voipfone account.

## Installation

Add lita-voipfone to your Lita instance's Gemfile:

``` ruby
gem "lita-voipfone"
```

And follow the instructions to set up Lita here: http://docs.lita.io/getting-started/

## Configuration

You'll need to add 2 lines in your lita config:

```ruby
  ## Set config for voipfone
  config.handlers.voipfone.username = "your login"
  config.handlers.voipfone.password = "your password"
```

## TODO

Lots and lots. At the moment it only does the following:

* `phone diverts`: display your diverts (also aliased as `phone show diverts`)
* `phone divert [number]`: divert to the number
* `phone undivert`: unset diverts	



## License

[MIT](http://opensource.org/licenses/MIT)

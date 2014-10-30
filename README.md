# SteamApi

SteamApi is a Ruby gem which allows you to interact with certain parts of the Steam Web API. It is a work in progress, as all methods are not completely implemented yet. Feel free to contribute :) 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'steam_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install steam_api

## Usage

All the methods to interact with the gem can be called after initializing a Client object.

Example:

```ruby
client = SteamApi::Client.new("###INSERT STEAM API KEY HERE###")
```

This will allow you to call methods such as:

```ruby
client.get_friend_list('76561197995163285')
```
where the number that is passed in the user's SteamID64. In order to fetch a user's SteamID64, you can call:

```ruby
client.resolve_vanity_url('youda')
```
where the string that is passed in is the Steam username. The SteamID64 is very important if you are wishing to gather information about certain users, many of the methods implement it.

For more information about other available methods, please refer to the documentation at http://www.rubydoc.info/github/YusefOuda/steam-api/master/frames

Information about the Steam API can be found at https://wiki.teamfortress.com/wiki/WebAPI and https://developer.valvesoftware.com/wiki/Steam_Web_API

## Contributing

1. Fork it ( https://github.com/[my-github-username]/steam_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

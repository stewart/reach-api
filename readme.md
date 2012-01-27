# reach-api

A Ruby wrapper for the Halo Reach stats API.

## installation

    [sudo] gem install reach-api

## usage

You'll need a Bungie-provided [API key][key]:

    require "reach-api"
    reach = Reach.new("your_key")

For information on API methods, please refer to the [wiki][].

## contributing

1. Fork it
2. Create a feature branch - `git checkout -b new_feature`
3. Commit your changes - `git commit -m "Added new feature"`
4. Push to GitHub - `git push origin new_feature`
5. Create a new Pull Request

## copyright

Copyright (c) 2012 Andrew Stewart. See `LICENSE` for more details

[key]: http://www.bungie.net/fanclub/statsapi/Group/GroupHome.aspx
[wiki]: http://www.haloreachapi.net/wiki/Main_Page

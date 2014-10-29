module SteamApi
  # This module is a container for all of the different URL's for the Steam Web API
  module Urls
    # A helper method which gets the base url for friend list API call
    # @param id [String] The users steam_id_64
    # @param relationship [String] The given relationship to look for (either friend or all)
    # @return [String] An interpolated string for the API call to get a users friends list.
    #   It contains the users ID, but not the API key
    def self.friend_list(id, relationship)
      "http://API.steampowered.com/ISteamUser/GetFriendList/v0001/?steamid=" + id + "&relationship=" + relationship
    end

    # A helper method which gets the base url for API call to get info about player bans
    # @param ids [String, Array] Either a single steam_id_64 as a string or array of multiple steam_id_64's
    # @return [String] An interpolated string for the API call (without the API key)
    def self.player_bans(ids)
      "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?&steamids=" + ids
    end
  end
end
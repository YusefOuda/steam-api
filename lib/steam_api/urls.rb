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
    # @param ids [String] A string containing a single steam_id_64 or multiple comma delimited steam_id_64s
    # @return [String] An interpolated string for the API call (without the API key)
    def self.player_bans(ids)
      "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?&steamids=" + ids
    end

    # A helper method which gets the base url for API call to get info about player summaries
    # @param ids [String] A string containing a single steam_id_64 or multiple comma delimited steam_id_64s
    # @return [String] An interpolated string for the API call (without the API key)
    def self.player_summaries(ids)
      "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?&steamids=" + ids
    end

    # A helper method which gets the base url for API call to get info about a players groups
    # @param ids [String] A single users steam_id_64
    # @return [String] An interpolated string for the API call (without the API key)
    def self.user_group_list(id)
      "http://api.steampowered.com/ISteamUser/GetUserGroupList/v1?steamid=" + id
    end
  end
end
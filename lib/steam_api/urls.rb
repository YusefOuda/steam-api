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
    # @param id [String] A single users steam_id_64
    # @return [String] An interpolated string for the API call (without the API key)
    def self.user_group_list(id)
      "http://api.steampowered.com/ISteamUser/GetUserGroupList/v1?steamid=" + id
    end

    # A helper method which gets the base url for API call to get a users steam_id_64
    # @param vanity_url [String] A single users vanity url
    # @return [String] An interpolated string for the API call (without the API key)
    def self.vanity_url(vanity_url)
      "http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?&vanityurl=" + vanity_url
    end

    # A helper method which gets the base url for API call to get global achievement percentages for app
    # @param id [String] A single Steam app id
    # @return [String] An interpolated string for the API call (without the API key)
    def self.global_achievement_percentages_for_app(id)
      "http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?&gameid=" + id
    end

    # A helper method which gets the base url for API call to get current number of players for an app
    # @param id [String] A single Steam app id
    # @return [String] An interpolated string for the API call (without the API key)
    def self.number_of_current_players(id)
      "http://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=" + id
    end

    # A helper method which gets the base url for API call to get achievement completion for a player and app
    # @param userid [String] A single user steam id 64
    # @param appid [String] A single Steam app id
    # @return [String] An interpolated string for the API call (without the API key)
    def self.player_achievements(userid, appid)
      "http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/v1/?&steamid=" + userid + '&appid=' + appid
    end

    # A helper method which gets the base url for API call to get a schema for a game
    # @param appid [String] A single game steam id
    # @return [String] An interpolated string for the API call (without the API key)
    def self.schema_for_game(appid)
      "http://api.steampowered.com/ISteamUserStats/GetSchemaForGame/v2/?&appid=" + appid
    end

    # A helper method which gets the base url for API call to get users stats for a game
    # @param userid [String] A single user id 64
    # @param appid [String] A single game steam id
    # @return [String] An interpolated string for the API call (without the API key)
    def self.user_stats_for_game(userid, appid)
      "http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v2/?&appid=" + appid + "&steamid=" + userid
    end

    # A helper method which gets the base url for API call to get info about users recently played games
    # @param userid [String] A single user id 64
    # @param count [Fixnum] The max number of games to find
    # @return [String] An interpolated string for the API call (without the API key)
    def self.recently_played_games(userid, count)
      "http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v1?&steamid=" + userid + "&count=#{count}"
    end

    # A helper method which gets the base url for API call to get info about users recently played games
    # @param userid [String] A single user id 64
    # @param count [Fixnum] The max number of games to find
    # @return [String] An interpolated string for the API call (without the API key)
    def self.owned_games(userid, include_appinfo, include_played_free_games)
      "http://api.steampowered.com/IPlayerService/GetOwnedGames/v1?&steamid=" + userid + "&include_played_free_games=#{include_played_free_games}&include_appinfo=#{include_appinfo}"
    end
  end
end
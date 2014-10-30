module SteamApi
  # This module is for interacting with the ISteamUserStats interface of the Steam Web API.
  # More information about this interface can be found at https://wiki.teamfortress.com/wiki/WebAPI
  module ISteamUserStats
    # Gets information about achievement percentages for a certain app.
    # @param gameid [String] A specific Steam app id
    # @return [Hash] Contains a hash with information about percentage completion
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetGlobalAchievementPercentagesForApp
    def get_global_achievement_percentages_for_app(gameid)
      url = SteamApi::Urls.global_achievement_percentages_for_app(gameid)
      response = get(url, key_needed: false)
    end

    # Gets information about number of current players for a certain app.
    # @param gameid [String] A specific Steam app id
    # @return [Hash] Contains a hash with information about number of current players
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetNumberOfCurrentPlayers
    def get_number_of_current_players(gameid)
      url = SteamApi::Urls.number_of_current_players(gameid)
      response = get(url, key_needed: false)
    end

    # Gets information about a players achievements for a specific app.
    # @param userid [String] A specific user's steam id 64
    # @param gameid [String] A specific game's steam id 64
    # @return [Hash] Contains a hash with information about the achievement completion if the user and game exist. The user must also be public
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetPlayerAchievements
    def get_player_achievements(userid, gameid)
      url = SteamApi::Urls.player_achievements(userid, gameid)
      response = get(url, key_needed: true)
    end

    # Gets information about the schema for a game for a specific id.
    # @param gameid [String] A specific game's steam id 64
    # @return [Hash] Contains a hash with information about the schema for a game. (if the game was found)
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetSchemaForGame
    def get_schema_for_game(gameid)
      url = SteamApi::Urls.schema_for_game(gameid)
      response = get(url, key_needed: true)
    end

    # Gets information about the users stats for a certain game
    # @param userid [String] A specific user's steam id 64
    # @param gameid [String] A specific game's steam id 64
    # @return [Hash] Contains a hash with information about the users stats for a game (if the game was found and profile is public)
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetUserStatsForGame
    def get_user_stats_for_game(userid, gameid)
      url = SteamApi::Urls.user_stats_for_game(userid, gameid)
      response = get(url, key_needed: true)
    end
  end
end
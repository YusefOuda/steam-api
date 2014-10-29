module SteamApi
  module ISteamUser
    # Gets a Steam user's friends list
    # @param id [String] The users steam_id_64
    # @return [Hash] Contains a hash containing friends list if user exists.
    #   In the case the user has a private profile, a hash will still be returned but it will empty
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetFriendList
    def get_friend_list(steamid, relationship="friend")
      url = "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{api_key}&steamid=#{steamid}&relationship=#{relationship}"
      response = get(url)
    end
    # Gets information about a Steam user (or users) ban history
    # @param steamids [String, Array] The user (or users) steam_id_64, either in a string or array
    # @return [Hash] Contains a hash with information about the users ban history.
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetPlayerBans
    def get_player_bans(steamids)
      if steamids.class == String
        steamids = [steamids]
      end
      url = "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?key=#{api_key}&steamids=#{steamids.join(',')}"
      response = get(url)
    end
  end
end
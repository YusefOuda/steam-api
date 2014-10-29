module SteamApi
  # This module is for interacting with the ISteamUser interface of the Steam Web API.
  # More information about this interface can be found at https://wiki.teamfortress.com/wiki/WebAPI
  module ISteamUser
    # Gets a Steam user's friends list.
    # @param steamid [String] The users steam_id_64
    # @return [Hash] Contains a hash containing friends list if user exists.
    #   In the case the user has a private profile, a hash will still be returned but it will empty
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetFriendList
    def get_friend_list(steamid, relationship="friend")
      url = SteamApi::Urls.friend_list(steamid, relationship)
      response = get(url, key_needed: true)
    end

    # Gets information about a Steam user (or users) ban history.
    # @param steamids [*String] The user (or users) steam_id_64.
    # @return [Hash] Contains a hash with information about the users ban history.
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetPlayerBans
    def get_player_bans(*steamids)
      stringified_ids = steamids.join(',')
      url = SteamApi::Urls.player_bans(stringified_ids)
      response = get(url, key_needed: true)
    end

    # Gets player summary(or summaries) about a Steam user (or users).
    # @param steamids [*String] The user (or users) steam_id_64.
    # @return [Hash] Contains a hash with player summaries for each passed in ID.
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetPlayerSummaries
    def get_player_summaries(*steamids)
      stringified_ids = steamids.join(',')
      url = SteamApi::Urls.player_summaries(stringified_ids)
      response = get(url, key_needed: true)
    end

    # Gets a list of users groups if the user has a public profile.
    # @param steamid [String] The user's steam_id_64
    # @return [Hash] Contains a hash with a list of the users groups
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/GetUserGroupList
    def get_user_group_list(steamid)
      url = SteamApi::Urls.user_group_list(steamid)
      response = get(url, key_needed: true)
    end

    # Gets a users steam_id_64 from vanity url.
    # @param vanity_url [String] Contains the vanity URL of a user
    # @return [Hash] Contains a hash which has the steam_id_64 of the given user (if it exists)
    # More information can be found at https://wiki.teamfortress.com/wiki/WebAPI/ResolveVanityURL
    def resolve_vanity_url(vanity_url)
      url = SteamApi::Urls.vanity_url(vanity_url)
      response = get(url, key_needed: true)
    end
  end
end
module SteamApi
  module Urls
    def self.friend_list(id, relationship)
      "http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?steamid=" + id + "&relationship=" + relationship
    end

    def self.player_bans(ids)
      "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?&steamids=" + ids
    end
  end
end
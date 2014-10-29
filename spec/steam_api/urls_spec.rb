describe SteamApi::Urls do
  describe '.friend_list' do
    it 'returns the base url for getting users friends list (with passed in id)' do
      result = SteamApi::Urls.friend_list('938457325', 'all')
      expect(result).to be_a(String)
    end

    it 'returns the base url for getting info about player bans (passed in id)' do
      result = SteamApi::Urls.player_bans('938457325')
      expect(result).to be_a(String)
    end

    it 'returns the base url for getting info about player summaries (passed in ids)' do
      result = SteamApi::Urls.player_summaries('938457325')
      expect(result).to be_a(String)
    end
  end
end
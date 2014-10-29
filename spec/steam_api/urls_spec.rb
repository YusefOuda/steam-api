describe SteamApi::Urls do
  describe '.friend_list' do
    it 'returns the base url for getting users friends list (with passed in id)' do
      result = SteamApi::Urls.friend_list('938457325', 'all')
      expect(result).to be_a(String)
    end
  end

  describe '.player_bans' do
    it 'returns the base url for getting info about player bans (passed in id)' do
      result = SteamApi::Urls.player_bans('938457325')
      expect(result).to be_a(String)
    end
  end

  describe '.player_summaries' do
    it 'returns the base url for getting info about player summaries (passed in ids)' do
      result = SteamApi::Urls.player_summaries('938457325')
      expect(result).to be_a(String)
    end
  end

  describe '.user_group_list' do
    it 'returns the base url for getting info about groups for a player' do
      result = SteamApi::Urls.user_group_list('938457325')
      expect(result).to be_a(String)
    end
  end

  describe '.vanity_url' do
    it 'returns the base url for getting info about a player\'s steam id' do
      result = SteamApi::Urls.vanity_url('youda')
      expect(result).to be_a(String)
    end
  end
end
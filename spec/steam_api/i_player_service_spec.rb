describe SteamApi::IPlayerService do
  before(:all) do
    @public_id = '76561197995163285'
    @private_id = '76561198002572492'
    @game_id = '730'
    @notfound_game_id = '12345'
    @invalid_game_id = '123 45'
    @notfound_id = '67734658237465083465238745693'
    @invalid_id = '76561199623423 72348002572492'
    @client = SteamApi::Client.new(ENV["STEAM_KEY"])
  end

  describe '#get_recently_played_games' do
    it 'returns a hash about the users recently played games' do
      VCR.use_cassette('get_recently_played_games') do
        result = @client.get_recently_played_games(@public_id)
        expect(result["response"]["games"]).to_not be_nil
      end
    end

    it 'also takes an optional count argument' do
      VCR.use_cassette('get_recently_played_games_count') do
        result = @client.get_recently_played_games(@public_id, 2)
        expect(result["response"]["games"].size).to eq(2)
      end
    end

    it 'returns a hash when profile is private (with no data)' do
      VCR.use_cassette('get_recently_played_games_private') do
        result = @client.get_recently_played_games(@private_id)
        expect(result["response"].size).to eq(0)
      end
    end
  end

  describe '#get_owned_games' do
    it 'returns a hash which contains the users owned games' do
      VCR.use_cassette('get_owned_games') do
        result = @client.get_owned_games(@public_id)
        expect(result["response"]["games"]).to_not be_nil
      end
    end

    it 'returns an empty hash if the user has a private profile' do
      VCR.use_cassette('get_owned_games_private') do
        result = @client.get_owned_games(@private_id)
        expect(result["response"]["games"]).to be_nil
      end
    end

    it 'can take an optional "include_appinfo parameter"' do
      VCR.use_cassette('get_owned_games_include_appinfo') do
        result = @client.get_owned_games(@public_id, include_appinfo: true)
        expect(result["response"]["games"].first["name"]).to_not be_nil
      end
    end

    it 'can take an optional "include_played_free_games" parameter"' do
      VCR.use_cassette('get_owned_games_include_played_free_games') do
        result = @client.get_owned_games(@public_id, include_played_free_games: true)
        expect(result["response"]["games"]).to_not be_nil
      end
    end

    it 'can take all the optional arguments' do
      VCR.use_cassette('get_owned_games_all_args') do
        result = @client.get_owned_games(@public_id, include_appinfo: true, include_played_free_games: true)
        expect(result["response"]["games"].first["name"]).to_not be_nil
      end
    end
  end

  describe '#get_steam_level' do
    it 'returns a hash containing the users steam level' do
      VCR.use_cassette('get_steam_level') do
        result = @client.get_steam_level(@public_id)
        expect(result["response"]["player_level"]).to_not be_nil
      end
    end

    it 'returns a hash containing the users steam level (with private profile)' do
      VCR.use_cassette('get_steam_level_private') do
        result = @client.get_steam_level(@private_id)
        expect(result["response"]["player_level"]).to_not be_nil
      end
    end
  end

  describe '#get_badges' do
    it 'returns a hash containing info about the users badges' do
      VCR.use_cassette('get_badges') do
        result = @client.get_badges(@public_id)
        expect(result["response"]["badges"].size).to be > 0
      end
    end

    it 'returns an empty hash if the user has a private profile' do
      VCR.use_cassette('get_badges_private') do
        result = @client.get_badges(@private_id)
        expect(result["response"].size).to eq(0)
      end
    end
  end

  describe '#get_community_badge_progress' do
    it 'returns a hash containing information about the users comunnity badge progress' do
      VCR.use_cassette('get_community_badge_progress') do
        result = @client.get_community_badge_progress(@public_id)
        expect(result["response"]["quests"]).to_not be_nil
      end
    end

    it 'returns a hash containing information about the users comunnity badge progress for private users' do
      VCR.use_cassette('get_community_badge_progress_private') do
        result = @client.get_community_badge_progress(@private_id)
        expect(result["response"]["quests"]).to_not be_nil
      end
    end

    it 'can also take an optional paramater to look at a specific badge id' do
      VCR.use_cassette('get_community_badge_progress_specific_badge') do
        result = @client.get_community_badge_progress(@public_id, badge_id: 2)
        expect(result["response"]["quests"]).to_not be_nil
      end
    end
  end
end
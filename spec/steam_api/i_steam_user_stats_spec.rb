describe SteamApi::ISteamUserStats do
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

  describe '#get_global_achievement_percentages_for_app' do
    it 'returns a hash containing achievements and their global percentage completion for an app' do
      VCR.use_cassette('get_global_achievement_percentages_for_app') do
        result = @client.get_global_achievement_percentages_for_app(@game_id)
        expect(result["achievementpercentages"]["achievements"]).to_not be_nil
      end
    end

    it 'returns an empty hash when the app is not found' do
      VCR.use_cassette('get_global_achievement_percentages_for_app_not_found') do
        result = @client.get_global_achievement_percentages_for_app(@notfound_game_id)
        expect(result["achievementpercentages"]).to be_nil
      end
    end

    it 'returns an empty hash when an invalid id is inputted' do
      VCR.use_cassette('get_global_achievement_percentages_for_app_invalid') do
        result = @client.get_global_achievement_percentages_for_app(@invalid_game_id)
        expect(result["achievementpercentages"]).to be_nil
      end
    end
  end

  describe '#get_global_achievement_percentages_for_game' do
    xit 'returns a hash which contains global stats about a specific game' do

    end
  end

  describe '#get_number_of_current_players' do
    it 'returns a hash which contains number of current players' do
      VCR.use_cassette('get_number_of_current_players') do
        result = @client.get_number_of_current_players(@game_id)
        expect(result["response"]["result"]).to eq(1)
      end
    end

    it 'returns a hash which contains result of 42 if app id does not exist' do
      VCR.use_cassette('get_number_of_current_players_not_found') do
        result = @client.get_number_of_current_players(@notfound_game_id)
        expect(result["response"]["result"]).to eq(42)
      end
    end
  end

  describe '#get_player_achievements' do
    it 'returns a hash containing info about players achievement completion' do
      VCR.use_cassette('get_player_achievements') do
        result = @client.get_player_achievements(@public_id, @game_id)
        expect(result["playerstats"]["achievements"]).to_not be_nil
      end
    end

    it 'returns a hash containing an error message if user is private' do
      VCR.use_cassette('get_player_achievements_private') do
        result = @client.get_player_achievements(@private_id, @game_id)
        expect(result["playerstats"]["error"]).to_not be_nil
        expect(result["playerstats"]["success"]).to be false
      end
    end

    it 'returns a hash containing an error message if user does not exist' do
      VCR.use_cassette('get_player_achievements_user_not_found') do
        result = @client.get_player_achievements(@notfound_id, @game_id)
        expect(result["playerstats"]["error"]).to_not be_nil
        expect(result["playerstats"]["success"]).to be false
      end
    end

    it 'returns a hash containing an error message if the game does not have stats (or does not exist)' do
      VCR.use_cassette('get_player_achievements_game_no_stats') do
        result = @client.get_player_achievements(@public_id, @notfound_game_id)
        expect(result["playerstats"]["error"]).to_not be_nil
        expect(result["playerstats"]["success"]).to be false
      end
    end
  end

  describe '#get_schema_for_game' do
    it 'returns a hash containing the schema for a game' do
      VCR.use_cassette('get_schema_for_game') do
        result = @client.get_schema_for_game(@game_id)
        expect(result["game"]).to_not be_nil
      end
    end

    it 'returns an empty hash if the game does not exist' do
      VCR.use_cassette('get_schema_for_game_not_found') do
        result = @client.get_schema_for_game(@notfound_game_id)
        expect(result["game"]).to be_nil
      end
    end

    it 'returns an empty hash if it is an invalid game id' do
      VCR.use_cassette('get_schema_for_game_invalid') do
        result = @client.get_schema_for_game(@invalid_game_id)
        expect(result["game"]).to be_nil
      end
    end
  end

  describe '#get_user_stats_for_game' do
    it 'returns a hash containing the users stats for a certain game' do
      VCR.use_cassette('get_user_stats_for_game') do
        result = @client.get_user_stats_for_game(@public_id, @game_id)
        expect(result["playerstats"]).to_not be_nil
      end
    end

    it 'returns a hash with an error message if the profile is private' do
      VCR.use_cassette('get_user_stats_for_game_private') do
        result = @client.get_user_stats_for_game(@private_id, @game_id)
        expect(result["error"]).to_not be_nil
      end
    end

    it 'returns an empty hash if the user was not found' do
      VCR.use_cassette('get_user_stats_for_game_user_not_found') do
        result = @client.get_user_stats_for_game(@notfound_id, @game_id)
        expect(result.size).to eq(0)
      end
    end

    it 'returns an empty hash if the game was not found' do
      VCR.use_cassette('get_user_stats_for_game_game_not_found') do
        result = @client.get_user_stats_for_game(@public_id, @notfound_game_id)
        expect(result.size).to eq(0)
      end
    end
  end
end
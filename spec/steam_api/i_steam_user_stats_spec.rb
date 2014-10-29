describe SteamApi::ISteamUserStats do
  before(:all) do
    @game_id = '730'
    @notfound_game_id = '12345'
    @invalid_game_id = '123 45'
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

end
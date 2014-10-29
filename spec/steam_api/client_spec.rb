describe SteamApi::Client do
  describe '#initialize' do
    it 'should initialize a Client object with a steam API key' do
      key = '1uih1341iu23g4'
      client = SteamApi::Client.new(key)
      expect(client).to be_a(SteamApi::Client)
      expect(client.api_key).to eq(key)
    end
  end

  describe '#get' do
    it 'should call the Steam API using the given URL and return a hash' do
      VCR.use_cassette('client_get') do
        client  = SteamApi::Client.new(ENV["STEAM_KEY"])
        url = "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?steamids=76561198002572492"
        result = client.get(url, key_needed: true)
        expect(result["players"]).to_not be_nil
      end
    end

    it 'should return a hash with an error message if the api_key is invalid' do
      VCR.use_cassette('client_get_invalid') do
        client = SteamApi::Client.new("9a8sf769ds9f7 7f9asd")
        url = "http://api.steampowered.com/ISteamUser/GetPlayerBans/v1?steamids=76561198002572492"
        result = client.get(url, key_needed: true)
        expect(result["error"]).to_not be_nil
      end
    end
  end
end
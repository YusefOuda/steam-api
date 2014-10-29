describe SteamApi::Client do
  describe '#initialize' do
    it 'should initialize a Client object with a steam API key' do
      key = '1uih1341iu23g4'
      client = SteamApi::Client.new(key)
      expect(client).to be_a(SteamApi::Client)
      expect(client.api_key).to eq(key)
    end
  end
end
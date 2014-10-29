describe SteamApi::ISteamUser do
  before(:all) do
    key = ENV['STEAM_KEY']
    @public_id = '76561197995163285'
    @private_id = '76561198002572492'
    @invalid_id = '76561199623423238472348002572492'
    @client = SteamApi::Client.new(key)
  end

  describe '.get_friend_list' do
    it "returns a hash containing the user's friends" do
      id = '76561197995163285'
      result = @client.get_friend_list(@public_id)
      expect(result).to be_a(Hash)
      expect(result["friendslist"]).to_not be_nil
    end

    it "returns a hash when the user has a private profile" do
      id = '76561198002572492'
      result = @client.get_friend_list(@private_id)
      expect(result["friendslist"]).to be_nil
    end

    it "returns a hash containing error message when user is not found" do
      id = '76561197998888888888888885163285'
      result = @client.get_friend_list(@invalid_id)
      expect(result).to be_a(Hash)
      expect(result["friendslist"]).to be_nil 
      expect(result[:error]).to be_a(String)     
    end
  end

  describe '.get_player_bans' do
    it "returns a hash containing information about a players ban history" do
      result = @client.get_player_bans(@public_id)
      expect(result["players"]).to_not be_nil
    end
  end
end
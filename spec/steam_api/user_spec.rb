describe SteamApi::ISteamUser do
  before(:all) do
    key = ENV['STEAM_KEY']
    @public_id = '76561197995163285'
    @private_id = '76561198002572492'
    @notfound_id = '67734658237465083465238745693'
    @invalid_id = '76561199623423 72348002572492'
    @client = SteamApi::Client.new(key)
  end

  describe '.get_friend_list' do
    it "returns a hash containing the user's friends" do
      result = @client.get_friend_list(@public_id)
      expect(result).to be_a(Hash)
      expect(result["friendslist"]).to_not be_nil
    end

    it "returns a hash when the user has a private profile" do
      result = @client.get_friend_list(@private_id)
      expect(result["friendslist"]).to be_nil
    end

    it "returns a hash containing error message when user is not found" do
      result = @client.get_friend_list(@notfound_id)
      expect(result).to be_a(Hash)
      expect(result["friendslist"]).to be_nil 
      expect(result[:error]).to be_a(String)     
    end

    it "returns a hash containing error message when it is an invalid id" do
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

    it "returns a hash containing information when multiple ids are passed in" do
      result = @client.get_player_bans([@public_id, @private_id])
      expect(result["players"].size).to eq(2)
    end

    it "returns a hash containing error message when user not found" do
      result = @client.get_player_bans(@notfound_id)
      expect(result["players"].size).to eq(0)
    end

    it "returns a hash containing error message when it is invalid id" do
      result = @client.get_player_bans(@invalid_id)
      expect(result[:error]).to be_a(String)
    end
  end
end
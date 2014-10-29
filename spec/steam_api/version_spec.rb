describe SteamApi::VERSION do
  it 'should return the version number as a string' do
    version = SteamApi::VERSION
    expect(version).to_not be_nil
    expect(version).to be_a(String)
  end
end
module SteamApi
  class Client
    include SteamApi::ISteamUser
    attr_reader :api_key
    # This method is the entry point to use the API. It is initialized with an API key.
    # @param api_key [String] The API key for Steam API
    def initialize(api_key)
      @api_key = api_key
    end

    def get(url)
      begin
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        parsed = JSON.parse(response.body)
        return parsed
      rescue JSON::ParserError
        return {
          error: "There was an internal server error."
        }
      rescue URI::InvalidURIError
        return {
          error: "bad URI(is not URI?)"
        }
      end
    end
  end
end
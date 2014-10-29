module SteamApi
  # This Client class is to be used as the entry point to the rest of the program. A client object should be initialized
  # and with that object comes the ability to use any of the methods which call the Steam API.
  class Client
    include SteamApi::ISteamUser
    attr_reader :api_key
    # This method is the entry point to use the API. It is initialized with an API key. Only one instance of this
    # class should exist to interface with the API
    # @param api_key [String] The API key for Steam API (can be gotten from https://steamcommunity.com/dev/apikey)
    def initialize(api_key)
      @api_key = api_key
    end

    # This method is a helper method which many other methods rely on to call the Steam API
    # @param url [String] This should be the base url for the desired API call
    # @param key_needed [Boolean] This is a boolean value which is used to decide 
    #     whether a specific API call needs to have a key interpolated into the URL
    # @return [Hash] The return value is a hash, but its contents depends on the success
    #     or lack thereof, of the api call. If it was successful, it returns the JSON as a
    #     hash. Otherwise, it returns a hash with an error message.
    def get(url, key_needed: true)
      url = add_key url if key_needed
      begin
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        parsed = JSON.parse(response.body)
        return parsed
      rescue JSON::ParserError
        return {
          "error" => "There was an internal server error."
        }
      rescue URI::InvalidURIError
        return {
          "error" => "bad URI(is not URI?)"
        }
      end
    end

    private
    def add_key(url)
      url + "&key=" + @api_key
    end
  end
end
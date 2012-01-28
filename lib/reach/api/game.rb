module Reach
  class API
    module Game

      # Public: Fetches metadata dictionaries
      #
      # Returns a hash
      def get_game_metadata
        uri = ENDPOINT + "game/metadata/#{key}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches detailed game information
      #
      # id - the ID of the game to get details for
      #
      # Returns a hash
      def get_game_details(id)
        uri = ENDPOINT + "game/details/#{key}/#{id}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches current challenges
      #
      # gamertag - optional gamertag to get
      #            challenge progress for
      #
      # Returns a hash
      def get_current_challenges(gamertag = nil)
        if gamertag
          gamertag = gamertag.gsub(' ', '%20')
          uri = ENDPOINT + "game/challenges/#{key}/#{gamertag}"
        else
          uri = ENDPOINT + "game/challenges/#{key}"
        end
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end
    end
  end
end

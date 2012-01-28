module Reach
  class API
    module Player

      # Public: Fetches a player's list of games
      # in reverse chronological order
      #
      # gamertag - player to fetch game history for
      # variant - which game type to look for ("Unknown" returns all)
      # page - which page of results to get (pages of 25)
      #
      # Returns a hash
      def get_game_history(gamertag, variant = "Unknown", page = 0)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "player/gamehistory/#{key}/#{gamertag}/#{variant}/#{page}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches detailed player info, sorted
      # by map
      #
      # gamertag - player to get information about
      #
      # Returns a hash
      def get_player_details_with_stats_by_map(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "player/details/bymap/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches detailed player info, sorted
      # by playlist
      #
      # gamertag - player to get information about
      #
      # Returns a hash
      def get_player_details_with_stats_by_playlist(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "player/details/byplaylist/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches basic player information
      #
      # gamertag - player to get information about
      #
      # Returns a hash
      def get_player_details_with_no_stats(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "player/details/nostats/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end
    end
  end
end

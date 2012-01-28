module Reach
  class API
    module File

      # Public: Fetches a listing of files in a player's
      # file share
      #
      # gamertag - the player to get a file listing for
      #
      # Returns a hash
      def get_player_file_share(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "file/share/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches information on a specific file
      #
      # id - the ID of the file to get information on
      #
      # Returns a hash
      def get_file_details(id)
        uri = ENDPOINT + "file/details/#{key}/#{id}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches a list of a player's recent screenshots
      #
      # gamertag - the specified player
      #
      # Returns a hash
      def get_player_recent_screenshots(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "file/screenshots/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches a list of file sets belonging
      # to a player
      #
      # gamertag - the player to get a list of file sets for
      #
      # Returns a hash
      def get_player_file_sets(gamertag)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "file/sets/#{key}/#{gamertag}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches a list of files in a player's
      # file set
      #
      # gamertag - the specified player
      # id       - the fileset ID
      #
      # Returns a hash
      def get_player_file_set_files(gamertag, id)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "file/sets/files/#{key}/#{gamertag}/#{id}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches a list of rendered videos
      # belonging to a player
      #
      # gamertag - the specified player
      # page     - an optional page of results to fetch
      #
      # Returns a hash
      def get_player_rendered_videos(gamertag, page = 0)
        gamertag = gamertag.gsub(' ', '%20')
        uri = ENDPOINT + "file/videos/#{key}/#{gamertag}/#{page}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end

      # Public: Fetches a listing of files matching search criteria
      #
      # file_category - the type of file to search for
      # map_filter    - an map to limit results
      # engine_filter - an game engine type to limit results
      # date_filter   - a required date filter
      # sort_filter   - a required sort parameter
      # tags          - a semicolon-delimited list of tags to search for
      # page          - the page of results to fetch
      #
      # Returns a hash containing search results
      def reach_file_search(file_category, map_filter, engine_filter, date_filter, sort_filter, tags = '', page = 0)
        uri = ENDPOINT + "file/search/#{key}/#{file_category}/#{map_filter}/#{engine_filter}/#{date_filter}/#{sort_filter}/#{page}?tags=#{tags}"
        data = JSON.parse(self.class.get(uri).body, :symbolize_names => true)
        Reach::Helper::convert_keys(data)
      end
    end
  end
end

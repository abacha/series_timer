require_relative 'episode'
require_relative 'parser/nokogiri'
require_relative 'parser/regex'

module SeriesTimer
  module Crawler
    class << self
      CACHE_DIR = File.join(File.dirname(__FILE__), '../../cache/')

      def get_episodes(serie, options)
        if options == :force
          web(serie)
        else
          File.exists?(get_cache_file(serie)) ? cache(serie) : web(serie)
        end
      end

      private
      def parse_episodes(html)
        begin
          Parser::Nokogiri.parse(html)
        rescue StandardError => error
          Parser::Regex.parse(html)
        end
      end

      def get_cache_file(serie)
        "#{CACHE_DIR}#{serie}.cache"
      end

      def web(serie)
        renamed_serie = serie.gsub(" ", "_")
        uri =
          URI("http://en.wikipedia.org/wiki/List_of_#{renamed_serie}_episodes")
        response = Net::HTTP.get_response(uri)
        raise InvalidSerieException if response.code == "404"

        episodes = parse_episodes(response.body)
        raise NoEpisodesFoundException if episodes.empty?
        File.write(get_cache_file(serie), episodes)
        cache(serie)
      end

      def cache(serie)
        episodes = JSON.parse(File.read(get_cache_file(serie)))
        episodes.map do |episode|
          Episode.new(serie, *episode)
        end
      end
    end
  end
end

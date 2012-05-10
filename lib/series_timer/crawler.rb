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
        File.write(get_cache_file(serie), episodes)
        cache(serie)
      end

      def cache(serie)
        episodes_parsed = JSON.parse(File.read(get_cache_file(serie)))
        season          = 1
        episodes        = []

        episodes_parsed.each do |episode|
          season += 1 if !episodes.empty? && 
            episodes.last.number > episode[0].to_i
          unless episode[1].empty?
            episodes << Episode.new(serie, season.to_i, *episode) 
          end
        end
        raise NoEpisodesFoundException if episodes.empty?
        episodes
      end
    end
  end
end

require_relative 'episode'
require 'nokogiri'

module SeriesTimer
  module Crawler
    class << self

      REGEX_EPISODES = /<td>(\d+)<\/td>[^<]+<td[^>]+>"(?:<b><a[^>]+>|<b>)([^<]*)(?:<\/a><\/b>|<\/b>)".*?<span[^>]+>([0-9-]+)<\/span>/m
      CACHE_DIR = File.join(File.dirname(__FILE__), '../../cache/')

      def get_episodes(serie, options)
        if options == :force
          web(serie)
        else
          File.exists?(get_cache_file(serie)) ? cache(serie) : web(serie)
        end
      end

      private
      def parse_episodes(serie, html)
        # html.scan(REGEX_EPISODES)

        doc = Nokogiri::HTML(html)

        seasons = doc.css("h2 span.mw-headline").map { |h| h.text }
        seasons = seasons.select { |s| !s.scan(/Season \d/).empty? }
        seasons.map! {|s| s.scan(/Season \d/)[0] }

        episodes = doc.css("tr.vevent")
        episodes.map do |episode|
          tds = episode.css("td")
          number_in_series = tds[0].text
          number_in_season = tds[1].text
          name = tds[2].text
          date = episode.css("td span span.published").first.text
          [number_in_season, name, date]
        end.compact
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

        episodes = parse_episodes(serie, response.body)
        File.open(get_cache_file(serie), 'w') { |file| file.write(episodes) }
        cache(serie)
      end

      def cache(serie)
        episodes_parsed = JSON.parse(File.open(get_cache_file(serie), "r").read)
        season          = 1
        episodes        = []

        episodes_parsed.each do |episode|
          season += 1 if !episodes.empty? && 
            episodes.last.number > episode[0].to_i
          unless episode[1].empty?
            episodes << Episode.new(serie, season.to_i, *episode) 
          end
        end
        episodes
      end

    end
  end
end

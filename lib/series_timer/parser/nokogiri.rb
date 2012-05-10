require 'nokogiri'

module SeriesTimer
  module Parser
    module Nokogiri
      def self.parse(html)
        doc = ::Nokogiri::HTML(html)
        seasons = doc.css("h3 + * + table")
        seasons = doc.css("h3 + table") if seasons.empty? # thanks wikipedia
        seasons = doc.css("h2 + * + table") if seasons.empty? # thanks wikipedia
        episodes = []
        seasons.size.times do |season_index|
          seasons[season_index].css("tr.vevent").map do |episode|
            tds = episode.css("td")
            number_in_season = tds[1].text
            title_node = episode.css("td.summary")
            title_node.search('//sup').remove
            title = title_node.text
            date = episode.css("td span span.published").first.text
            episodes << [season_index+1, number_in_season, title, date]
          end.compact
        end
        episodes
      end
    end
  end
end

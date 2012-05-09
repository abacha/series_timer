require 'nokogiri'

module SeriesTimer
  module Parser
    module Nokogiri
      def self.parse(html)
        doc = ::Nokogiri::HTML(html)

        # seasons = doc.css("h2 span.mw-headline").map { |h| h.text }
        # seasons = seasons.select { |s| !s.scan(/Season \d/).empty? }
        # seasons.map! {|s| s.scan(/Season \d/)[0] }

        episodes = doc.css("tr.vevent")
        episodes.map do |episode|
          tds = episode.css("td")
          number_in_series = tds[0].text
          number_in_season = tds[1].text
          title_node = episode.css("td.summary")
          title_node.search('//sup').remove
          title = title_node.text
          date = episode.css("td span span.published").first.text
          [number_in_season, title, date]
        end.compact
      end
    end
  end
end

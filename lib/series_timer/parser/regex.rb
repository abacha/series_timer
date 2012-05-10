module SeriesTimer
  module Parser
    module Regex
      REGEX_EPISODES = /<td>(\d+)<\/td>[^<]+<td[^>]+>"(?:<b><a[^>]+>|<b>|<a[^>]+>)?([^<]*)(?:<\/a><\/b>|<\/b>|<\/a>)?".*?<span[^>]+>([0-9-]+)<\/span>/m

      def self.parse(html)
        episodes = html.scan(REGEX_EPISODES)
        episodes.each do |episode|
          season += 1 if !episodes.empty? &&
            episodes.last.number > episode[0].to_i
        end
      end
    end
  end
end

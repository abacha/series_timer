module SeriesTimer
  module Parser
    module Regex
      REGEX_EPISODES = /<td>(\d+)<\/td>[^<]+<td[^>]+>"(?:<b><a[^>]+>|<b>|<a[^>]+>)?([^<]*)(?:<\/a><\/b>|<\/b>|<\/a>)?".*?<span[^>]+>([0-9-]+)<\/span>/m

      def self.parse(html)
        html.scan(REGEX_EPISODES)
      end
    end
  end
end

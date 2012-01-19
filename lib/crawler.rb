require_relative 'episode'
require 'net/http'
require 'yajl'

module Crawler

  class << self
    
    REGEX_EPISODES = 
      Regexp.new(/<td>(\d+)<\/td>.*?<td class="summary" [^>]+>(?:"<b>)?(?:<a [^>]+>)?([\w\s]*)(?:<\/a>)?(?:<\/b>")?.*?<span[^>]+>([0-9-]+)<\/span>/m)


    def get_episodes(serie)
      File.exists?(get_cache_file(serie)) ? cache(serie) : web(serie)
    end

    private
    def parse_episodes(serie, html)
      episodes      = []
      html.scan(REGEX_EPISODES) do |episode| 
        episodes << episode
      end
      episodes
    end
    
    def get_cache_file(serie)
      File.join(File.dirname(__FILE__), "../cache/") + serie + ".cache"
    end

    def web(serie)
      renamed_serie = serie.gsub(" ", "_")
      raw = Net::HTTP.get("en.wikipedia.org", 
                          "/wiki/List_of_" + renamed_serie + "_episodes")
      episodes = parse_episodes(serie, raw)
      File.open(get_cache_file(serie), 'w') { |f| f.write(episodes) }
      cache(serie)
    end

    def cache(serie)
      parser = Yajl::Parser.new
      episodes_parsed = parser.parse(File.open(get_cache_file(serie), "r").read)
      episodes = episodes_parsed.map do |episode|
        Episode.new(serie, *episode)
      end
      episodes
    end

  end

end

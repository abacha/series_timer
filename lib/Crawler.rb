require 'rubygems'
require 'net/http'

class Crawler

  def initialize
    @servers = {
      "good_wife"           => [ "en.wikipedia.org", 
                                 "/wiki/List_of_The_Good_Wife_episodes" ],
      "two_and_a_half_men"  => [ "en.wikipedia.org", 
                                 "/wiki/List_of_Two_and_a_Half_Men_episodes" ]
    }

    @regex_episodes = 
      Regexp.new(/<td class="summary" [^>]+>.*?<b>(.*?)<\/b>.*?<span[^>]+>([0-9-]+)<\/span>/m)
  end

  def get(serie)
    File.exists?(get_cache_file(serie)) ? cache(serie) : web(serie)
  end

  def parse_episodes(serie)
    get(serie).scan(@regex_episodes)
  end

  private
  def get_cache_file(serie)
    "cache/" + serie + ".cache"
  end

  def web(serie)
    raw = Net::HTTP.get(@servers[serie][0], @servers[serie][1])
    File.open(get_cache_file(serie), 'w') { |f| f.write(raw) }
    raw
  end

  def cache(serie)
    File.open(get_cache_file(serie), "r").read
  end

end

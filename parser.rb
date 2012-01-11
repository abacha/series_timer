require 'rubygems'
require 'pry'
require 'net/http'
require 'date'

class Crawler

  def initialize
    @servers = {
      "good_wife" => [ "en.wikipedia.org",  "/wiki/List_of_The_Good_Wife_episodes" ] 
    }
    @regex_episodes = Regexp.new(/<td class="summary" [^>]+>.*?<b>(.*?)<\/b>.*?<span[^>]+>([0-9-]+)<\/span>/m)
  end

  def get(serie)
    File.exists?(serie + ".cache") ? cache(serie) : web(serie)
  end

  def parse_episodes(serie)
    get(serie).scan(@regex_episodes)
  end

  private
  def web(serie)
    raw = Net::HTTP.get(@servers[serie][0], @servers[serie][1])
    File.open(serie + ".cache", 'w') { |f| f.write(raw) }
    raw
  end

  def cache(serie)
    File.open(serie + ".cache", "r").read
  end

end



c = Crawler.new
episodes = c.parse_episodes("good_wife")
next_episode = []
episodes.reverse_each { |episode|
  date_test = Date.parse(episode[1])
  if date_test > Date.today && (next_episode == [] || date_test > next_episode[1])
    next_episode = [ episode[0], date_test ]
  end
}
p next_episode

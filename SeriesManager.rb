require 'Crawler'
require 'date'

class SeriesManager

  def get_next_episode(serie)
    crawler       = Crawler.new
    episodes      = crawler.parse_episodes(serie)
    next_episode  = []

    episodes.reverse_each do |episode|
      break if Date.parse(episode[1]) < Date.today
      next_episode = episode
    end
    next_episode
  end

end

require_relative 'crawler'
require 'date'

class SeriesManager

  def get_next_episode(serie)
    crawler       = Crawler.new
    episodes      = crawler.parse_episodes(serie)
    next_episode  = []

    episodes.reverse_each do |episode|
      break if Date.parse(episode[2]) < Date.today && !next_episode.empty?
      next_episode = episode
    end
    Date.parse(next_episode[2]) > Date.today ? next_episode : []
  end

  def get_countdown_next_episode(serie)
    episode = get_next_episode(serie)
    return if episode.empty?
    "S00" + ("e%02d" % episode[0].to_i) + " - " + episode[1] + parse_date(DateTime.parse(episode[2]))
  end

end

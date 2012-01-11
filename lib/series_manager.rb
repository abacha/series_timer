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

  private
  def parse_date(ctime)
    # binding.pry
    difference = ctime - DateTime.now
    seconds    =  difference % 60
    difference = (difference - seconds) / 60
    minutes    =  difference % 60
    difference = (difference - minutes) / 60
    hours      =  difference % 24
    difference = (difference - hours)   / 24
    days       =  difference % 7
    weeks      = (difference - days)    /  7
    "(#{weeks} weeks, #{days} days, #{hours}:#{minutes}:#{seconds})"
  end

end

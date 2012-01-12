require_relative 'crawler'
require 'date'
require 'pry'

class SeriesManager

  def get_next_episode(serie)
    crawler       = Crawler.new
    episodes      = crawler.parse_episodes(serie)
    next_episode  = Episode.new

    episodes.reverse_each do |episode|
      break if episode.date < Date.today && !next_episode.empty?
      next_episode = episode
    end
    next_episode.date > Date.today ? next_episode : nil
  end

  def get_countdown_next_episode(serie)
    episode = get_next_episode(serie)
    return if episode.empty?
    "S00" + ("e%02d" % episode.number) + " - " + episode.title + episode.date
  end

end

class Episode < Struct.new(:serie, :number_raw, :title, :date_raw)
  
  def date
    @date ||= Date.parse date_raw
  end

  def number
    @number ||= number_raw.to_i
  end

  def empty?
    number_raw == nil
  end

end


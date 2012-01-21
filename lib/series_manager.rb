require_relative 'crawler'
require 'date'

module SeriesManager

  class << self

    def get_next_episode(serie)
      episodes      = Crawler.get_episodes(serie)
      next_episode  = episodes.find { |episode| episode.date >= Date.today } 
    end

    def get_countdown_next_episode(serie)
      episode = get_next_episode(serie)
      return if episode.nil?
      "[#{serie}] S%02de%02d #{episode.title} (#{episode.countdown.to_s})" % 
        [ episode.season, episode.number ]
    end

  end

end

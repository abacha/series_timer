require_relative 'crawler'

module SeriesManager

  class << self

    def get_next_episode(serie)
      episodes      = Crawler.parse_episodes(serie)
      next_episode  = episodes.find { |episode| episode.date >= Date.today } 
    end

    def get_countdown_next_episode(serie)
      episode = get_next_episode(serie)
      return if episode.empty?
      "S00" + ("e%02d" % episode.number) + " - " + episode.title + episode.date
    end

  end

end

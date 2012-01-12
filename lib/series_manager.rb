require_relative 'crawler'

module SeriesManager

  class << self

    def get_next_episode(serie)
      episodes      = Crawler.parse_episodes(serie)
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

end

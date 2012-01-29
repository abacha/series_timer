require_relative 'crawler'

module SeriesTimer
  module SeriesManager
    class << self

      def countdown(serie)
        episode = get_next_episode(serie)
        return if episode.nil?
        "#{episode.to_s} (#{episode.countdown})"
      end

      def last_episode(serie)
        episodes      = Crawler.get_episodes(serie)
        episodes.reject! { |episode| episode.date >= Date.today } 
        episodes.last
      end

      def all(serie)
        Crawler.get_episodes(serie)
      end

      private
      def get_next_episode(serie)
        episodes      = Crawler.get_episodes(serie)
        next_episode  = episodes.find { |episode| episode.date >= Date.today } 
      end

    end
  end
end

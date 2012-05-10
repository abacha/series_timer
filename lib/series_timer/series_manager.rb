module SeriesTimer
  module SeriesManager

    class << self
      def process(series, options)
        series.each do |serie|
          case options[:episodes]
          when :last
            puts last_episode(serie, options[:options])
          when :all
            puts all_episodes(serie, options[:options])
          else
            puts next_episode(serie, options[:options])
          end
        end
      end

      def all_episodes(serie, options)
        Crawler.get_episodes(serie, options).map(&:to_s)
      end

      def last_episode(serie, options)
        episodes = Crawler.get_episodes(serie, options)
        episodes.reject! { |episode| episode.date >= Date.today }
        return if episodes.nil?
        episodes.last.to_s
      end

      def next_episode(serie, options)
        episode = get_next_episode(serie, options)
        return if episode.nil?
        episode.to_s
      end

      private
      def get_next_episode(serie, options)
        episodes      = Crawler.get_episodes(serie, options)
        next_episode  = episodes.find { |episode| episode.date >= Date.today }
      end
    end

  end
end

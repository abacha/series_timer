module SeriesTimer
  module Application

    class << self

      USAGE = "usage: series_timer [-lan] [series1 series2 ...]"

      def run(argv=ARGV)
        parse_options(argv)
        SeriesManager.process(@series, @options)
      rescue SeriesTimer::InvalidSerieException
        abort_message "invalid series"
      rescue SeriesTimer::NoEpisodesFoundException
        abort_message "no episodes found"
      end

      private
      def abort_message(*args)
        abort "series_timer: #{args.join("\n")}"
      end

      def parser
        parser = OptionParser.new
        parser.on("-h") do
          puts USAGE
          exit
        end
        parser.on("-v") do
          puts VERSION
          exit
        end
        parser.on("-f") { @options[:options] = :force }
        parser.on("-n") { @options[:episodes] = :next }
        parser.on("-l") { @options[:episodes] = :last }
        parser.on("-a") { @options[:episodes] = :all }
        parser
      end

      def parse_options(argv)
        @options = {}
        @series = parser.parse(argv)
        raise ArgumentError if @series.empty?
      rescue OptionParser::InvalidOption => error
        abort_message error.message, USAGE
      rescue ArgumentError
        abort_message "you need to provide at least one series", USAGE
      end

    end

  end
end

require_relative '../lib/seriestimr/series_manager'

module SeriesTimr
  class Application
    
    def initialize(argv)
      @params, @series = parse_options(argv)
    end

    def parse_options(argv)
      params = {}
      parser = OptionParser.new
      parser.on("-c") { params[:episodes] = :countdown }
      parser.on("-l") { params[:episodes] = :last }
      parser.on("-a") { params[:episodes] = :all }
      series = parser.parse(argv)
      [params, series]
    end

    def run
      @series.each do |serie|
        case @params[:episodes]
          when :last
            puts SeriesManager.last_episode(serie)
          when :countdown
            puts SeriesManager.countdown(serie)
          when :all
            puts SeriesManager.all(serie)
          end
      end
    end

  end
end


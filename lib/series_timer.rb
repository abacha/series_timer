require 'bundler/setup'
require 'net/http'
require 'json'
require 'date'
require "optparse"
require_relative '../lib/series_timer/series_manager'
require_relative '../lib/series_timer/errors'

module SeriesTimer
  class Application
    
    def initialize(argv)
      @params, @series = parse_options(argv)
    end

    def parse_options(argv)
      params = {}
      parser = OptionParser.new
      parser.on("-n") { params[:episodes] = :next }
      parser.on("-l") { params[:episodes] = :last }
      parser.on("-a") { params[:episodes] = :all }
      series = parser.parse(argv)
      raise ArgumentError if series.empty?
      [params, series]
    end

    def run
      @series.each do |serie|
        case @params[:episodes]
          when :last
            puts SeriesManager.last_episode(serie)
          when :all
            puts SeriesManager.all_episodes(serie)
          else
            puts SeriesManager.next_episode(serie)
          end
      end
    end

  end
end


require 'bundler/setup'
require_relative '../lib/series_manager'

puts SeriesManager.get_countdown_next_episode("The Good Wife")
puts SeriesManager.get_countdown_next_episode("Two and a Half Men")
puts SeriesManager.get_countdown_next_episode("House")
puts SeriesManager.get_countdown_next_episode("Dexter")
puts SeriesManager.get_countdown_next_episode("The Big Bang Theory")

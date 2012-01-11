require_relative 'lib/series_manager'
require 'pry'
manager = SeriesManager.new
p manager.get_next_episode("The Good Wife")
p manager.get_next_episode("Two and a Half Men")
p manager.get_next_episode("House")
p manager.get_next_episode("Dexter")
binding.pry

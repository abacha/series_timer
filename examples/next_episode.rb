require 'date'
require 'pry'
require 'rubygems'
require 'net/http'
require_relative '../lib/series_manager'

p SeriesManager.get_next_episode("The Good Wife")
p SeriesManager.get_next_episode("Two and a Half Men")
p SeriesManager.get_next_episode("House")
p SeriesManager.get_next_episode("Dexter")
p SeriesManager.get_next_episode("The Big Bang Theory")
binding.pry

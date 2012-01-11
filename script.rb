require 'lib/SeriesManager'

manager = SeriesManager.new
p manager.get_next_episode("good_wife")
p manager.get_next_episode("two_and_a_half_men")

require 'rspec'
require 'webmock/rspec'
require 'evented-spec'
require 'awesome_print'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end
  
HOUSE_HTML =
  File.read("#{File.dirname(__FILE__)}/fixtures/House.html")
HOUSE_CACHE =
  File.read("#{File.dirname(__FILE__)}/fixtures/House.cache")

THE_GOOD_WIFE_HTML =
  File.read("#{File.dirname(__FILE__)}/fixtures/The_Good_Wife.html")
THE_GOOD_WIFE_CACHE =
  File.read("#{File.dirname(__FILE__)}/fixtures/The_Good_Wife.cache")

THE_4400_HTML =
  File.read("#{File.dirname(__FILE__)}/fixtures/The_4400.html")
THE_4400_CACHE =
  File.read("#{File.dirname(__FILE__)}/fixtures/The_4400.cache")

THE_WALKING_DEAD_HTML =
  File.read("#{File.dirname(__FILE__)}/fixtures/The_Walking_Dead.html")

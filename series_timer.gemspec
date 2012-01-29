require "#{File.dirname(__FILE__)}/lib/series_timer/version"

Gem::Specification.new do |s|
  s.name    = "Series Timer"
  s.version = SeriesTimer::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Adriano Bacha"]
  s.email = ["abacha@gmail.com"]
  s.homepage = "http://github.com/series_timer"
  s.summary = "scrapes the list of episodes of any series from wikipedia"
  s.description = "scrapes the list of episodes of any series from wikipedia"
  s.files = Dir.glob("{bin,lib,cache}/**/*") + %w(README.md)
  s.require_path = 'lib'
  s.executables = ["series_timer"]
  s.required_ruby_version = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "series_timer"
end

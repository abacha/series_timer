require 'spec_helper'
require 'series_timer'

describe SeriesTimer::Crawler do

  it "should raise an InvalidSerieException" do
    stub_request(:get, 
      "http://en.wikipedia.org/wiki/List_of_The_Walking_Dead_episodes").
      to_return(:status => 404)
    lambda { subject.web("The Walking Dead") }.should 
      raise_error(SeriesTimer::InvalidSerieException)
  end

  it "should get cache file path" do
    subject.send(:get_cache_file, "House").should 
      include("../../cache/House.cache")
  end

  it "should parse episodes" do
    subject.send(:parse_episodes, "The 4400", THE_4400_HTML).should
      have(40).things
  end

  it "should get the episodes from the web" do
    stub_request(:get, 
      "http://en.wikipedia.org/wiki/List_of_House_episodes").
      to_return(:status => 200, :body => HOUSE_HTML)
    subject.send(:web, "House").to_s.should include("Love Is Blind")
  end

end

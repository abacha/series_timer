require 'spec_helper'
require 'series_timer'

describe SeriesTimer::SeriesManager do

  before(:each) do
    Date.stub!(:today).and_return(Date.new(2012, 03, 12))
  end

  it "should list all episodes" do
    SeriesTimer::Crawler.stub!(:get_cache_file, :serie).and_return(
      "#{File.join(File.dirname(__FILE__), '../../fixtures/')}The_4400.cache")
    stub_request(:get, "http://en.wikipedia.org/wiki/List_of_The_4400_episodes").
      to_return(:status => 200, :body => THE_4400_HTML)
    subject.all_episodes("The 4400").should have(40).things
  end

  it "should get the next episode" do
    SeriesTimer::Crawler.stub!(:get_cache_file, :serie).and_return(
      "#{File.join(File.dirname(__FILE__), '../../fixtures/')}The_Good_Wife.cache")
    stub_request(:get, "http://en.wikipedia.org/wiki/List_of_The_Good_Wife_episodes").
      to_return(:status => 200, :body => THE_GOOD_WIFE_HTML)
    episode = subject.next_episode("The Good Wife")
    episode.should include("The Good Wife")
    episode.should include("S03E18")
    episode.should include("6 days")
  end

  it "should get the lasts episode" do
    SeriesTimer::Crawler.stub!(:get_cache_file, :serie).and_return(
      "#{File.join(File.dirname(__FILE__), '../../fixtures/')}House.cache")
    stub_request(:get, "http://en.wikipedia.org/wiki/List_of_House_episodes").
      to_return(:status => 200, :body => HOUSE_HTML)
    episode = subject.last_episode("House")
    episode.should include("House")
    episode.should include("S08E14")
    episode.should include("14 days ago")
  end
end

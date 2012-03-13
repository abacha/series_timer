require 'spec_helper'
require 'series_timer'

describe SeriesTimer::Episode do

  it "should build an episode" do
    Date.stub!(:today).and_return(Date.new(2012, 05, 03))
    episode = SeriesTimer::Episode.new("Serie Name", 1, "1", "Episode Name", 
                                       "2012-01-01")
    episode.empty?.should == false
    episode.date.should == Date.parse("2012-01-01")
    episode.number.should == 1
    episode.diffdays.should == "123 days ago"
    description = episode.to_s

    description.should include("Serie Name")
    description.should include("S01E01")
    description.should include("Episode Name")
    description.should include("123 days ago")
  end

end

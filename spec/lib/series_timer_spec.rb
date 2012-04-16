require 'spec_helper'
require 'series_timer'

module SeriesTimer
  describe Application do

    it "should call next episode" do
      SeriesManager.stub!(:next_episode).with("House", nil)
      Application.new(["-n", "House"]).run
    end

    it "should call last episode" do
      SeriesManager.stub!(:last_episode).with("House", nil)
      Application.new(["-l", "House"]).run
    end

    it "should call all episodes" do
      SeriesManager.stub!(:all_episodes).with("House", nil)
      Application.new(["-a", "House"]).run
    end

    it "should force an cache update" do
      SeriesManager.stub(:next_episode).with("House", :force)
      Application.new(["-n", "House", "-f"]).run
    end

    it "should raise an argument error" do
      lambda { Application.new("-l") }.should raise_error(ArgumentError)
    end

  end
end

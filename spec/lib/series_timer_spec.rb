require 'spec_helper'
require 'series_timer'

module SeriesTimer
  describe Application do

    it "should call next episode" do
      SeriesManager.stub!(:next_episode).with("House", nil)
      Application.run(["-n", "House"])
    end

    it "should call last episode" do
      SeriesManager.stub!(:last_episode).with("House", nil)
      Application.run(["-l", "House"])
    end

    it "should call all episodes" do
      SeriesManager.stub!(:all_episodes).with("House", nil)
      Application.run(["-a", "House"])
    end

    it "should force an cache update" do
      SeriesManager.stub(:next_episode).with("House", :force)
      Application.run(["-n", "House", "-f"])
    end

    it "should raise an argument error" do
      lambda { Application.run("-l") }
    end

  end
end

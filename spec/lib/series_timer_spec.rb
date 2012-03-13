require 'spec_helper'
require 'series_timer'

describe SeriesTimer::Application do

  before(:each) do
    @manager = SeriesTimer::SeriesManager
    @application = SeriesTimer::Application
  end

  it "should call next episode" do
    @manager.stub!(:next_episode)
    options = @application.new(["-n", "House"])
    options.instance_eval { @series }.should == ["House"]
    options.instance_eval { @params[:episodes] }.should == :next
    options.send(:run)
  end
  
  it "should call last episode" do
    @manager.stub!(:last_episode)
    options = @application.new(["-l", "House"])
    options.instance_eval { @series }.should == ["House"]
    options.instance_eval { @params[:episodes] }.should == :last
    options.send(:run)
  end

  it "should call all episodes" do
    @manager.stub!(:all_episodes)
    options = @application.new(["-a", "House"])
    options.instance_eval { @series }.should == ["House"]
    options.instance_eval { @params[:episodes] }.should == :all
    options.send(:run)
  end

  it "should raise an argument error" do
    lambda { @application.new("-l") }.should raise_error(ArgumentError)
  end

end

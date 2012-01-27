require "helper"

describe Reach::Version do
  it "should return a string" do
    string = Reach::Version.to_s
    string.should == "0.0.1"
  end
end

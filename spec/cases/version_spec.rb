require "helper"

describe Reach::Version do
  it "should return a string" do
    string = Reach::Version.to_s
    string.should be_a String
  end
end

require "helper"

describe Reach::API do
  it "should store an API key on creation" do
    reach = Reach.new("example_api_key")
    reach.key.should == "example_api_key"
  end

  it "should contain an API endpoint" do
    Reach::API::ENDPOINT.should == "http://www.bungie.net/api/reach/reachapijson.svc/"
  end
end

require "helper"

describe Reach::Helper do
  context "converting strings/symbols from CamelCase to snake_case" do
    it "shouldn't modify a snake_cased string" do
      Reach::Helper::to_snake_case("snake_case").should == "snake_case"
    end

    it "should convert a basic string" do
      Reach::Helper::to_snake_case("CamelCase").should == "camel_case"
    end

    it "should convert a string containing '::'" do
      Reach::Helper::to_snake_case("Module::Class").should == "module/class"
    end

    it "should convert a string containing a hypen '-'" do
      Reach::Helper::to_snake_case("Here-Say").should == "here_say"
    end

    it "should convert a symbol" do
      Reach::Helper::to_snake_case(:CamelCase).should == :camel_case
    end

    it "should return false on anything else" do
      Reach::Helper::to_snake_case({:hashKey => "hashvalue"}).should == false
    end
  end

  context "converting hash/array keys from CamelCase to snake_case" do
    it "should convert hash keys" do
      hash = {:hashKey => "hashValue"}
      Reach::Helper::convert_keys(hash).should == {:hash_key => "hashValue"}
    end

    it "should convert hash keys inside arrays" do
      array = [{:hashKey => "hashValue"}]
      Reach::Helper::convert_keys(array).should == [{:hash_key => "hashValue"}]
    end
  end
end

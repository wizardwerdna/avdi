require 'ostruct'
require_relative '../../lib/request'
describe Request do
  context "creation" do

    it "should handle a hash" do
      Request.new({a:5}).a.should==5
    end

    it "should handle an OpenStruct" do
      Request.new(OpenStruct.new(a:5)).a.should==5
    end 

    it "should handle objects ducking #attributes" do
      Request.new(stub(:attributes => {a:5})).a.should==5
    end

    it "should complain about other objects" do
      ->{Request.new(3)}.should raise_error ArgumentError
    end

  end

end

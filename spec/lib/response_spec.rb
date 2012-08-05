require_relative "../../lib/response"

describe Response do

  it "should provide NoResponse" do
    Response::NoResponse.should_not be_nil
  end

  context "creation" do

    it "should handle a hash" do
      Response.new({a:5}).a.should==5
    end

    it "should handle an OpenStruct" do
      Response.new(OpenStruct.new(a:5)).a.should==5
    end 

    it "should handle objects ducking #attributes" do
      Response.new(stub(:attributes => {a:5})).a.should==5
    end

    it "should complain about other objects" do
      ->{Response.new(3)}.should raise_error ArgumentError
    end

  end

end

require_relative '../../lib/interactor'

describe Interactor do

  let(:subject){Interactor.new(request)}
  let(:request){Request.new(foo: :bar)}
  let(:response){double "response"}

  it "should remember the request" do
    subject.r.should == request
  end

  it "should complain unless #run is redefined" do
    ->{subject.run}.should raise_error
  end

  it "should support the [] sugar correctly" do
    subject.should_receive(:run).and_return(response)
    Interactor.should_receive(:new).and_return(subject)
    Interactor[].should == response
  end

end

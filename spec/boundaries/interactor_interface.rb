require 'set'

shared_examples_for "an interactor" do
  it {should be_respond_to :run}
end

require_relative '../boundaries/interactor_interface'
require_relative '../../interactors/new_blog'

describe Interactors do

  describe Interactors::NewBlog do

    let(:subject){Interactors::NewBlog.new(request)}
    let(:request){Request.new}

    it_should_behave_like "an interactor"

    it "should respond with a new blog" do
      subject.execute.blog.should be_kind_of Blog
    end
  end

end

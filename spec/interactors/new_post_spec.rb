require_relative '../boundaries/interactor_interface'
require_relative '../../interactors/new_post'

describe Interactors do

  describe Interactors::NewPost do

    let(:blog){double("blog", kind_of?: true, new_post: nil)}
    let (:subject){Interactors::NewPost.new(request)}

    context "interface" do
      let(:request){Request.new}
      it_should_behave_like "an interactor" 
    end

    context "on execution" do
      let(:request){Request.new(blog: blog, title: 'title', body: 'body')}
      let(:post){double("post", {
        kind_of?: true,
        blog: blog, 
        title: request.title, 
        body: request.body
      })}
  
      before :each do
        blog.stub(new_post: post)
      end

      it "should obtain the post from blog" do
        blog.should_receive(:new_post).and_return post
        subject.run.blog.should == blog
      end

      it "should create a new post with the specified attributes" do
        p = subject.run.post
        p.title == request.title
        p.body == request.body
      end

      it "should bind the post to this blog" do 
        subject.run.blog.should == blog
      end

    end

    context "use case alternative 1: unspecified attributes" do
      let(:request){Request.new(blog: blog, title:nil)}
      let(:post){ Post.new blog: blog, title: "", body: "" }
      
      it "should create a new post with the specified attributes being empty" do
        blog.should_receive(:new_post).with(blog: blog, title: "", body: "").and_return post 
        p = subject.run
        p.post.title.should be_empty
        p.post.body.should be_empty
      end

    end

    context "use case alternative 2: bad <blog>" do

      it "should complain unless a blog is specified" do
        expect{Interactors::NewPost.new(title: 'foo', body: 'bar').
          run}.to raise_error(ArgumentError)
      end

      it "should complain unless the specified blog is a Blog" do
        expect{Interactors::NewPost.new(blog: 13).run}.to raise_error ArgumentError
      end

    end
  
  end

end

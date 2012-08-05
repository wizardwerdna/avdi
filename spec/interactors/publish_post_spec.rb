require_relative '../boundaries/interactor_interface'
require_relative '../../interactors/publish_post'

describe Interactors do

  describe Interactors::PublishPost do

    let(:blog){double("blog", kind_of?: true)}
    let (:subject){Interactors::PublishPost.new(request)}

    context "interface" do
      let(:request){Request.new}
      it_should_behave_like "an interactor" 
    end

    context "on execution" do
      let(:post){ OpenStruct.new post_hash }
      let(:request){ Request.new( post ) }
      let(:post_hash){ {
          blog: blog,
          title: "post_title",
          body: "post_body"
      } }

      before :each do
        post.stub(:publish => true)
        request.blog.stub(:new_post => post)
      end

      it "should construct a post from the post_source, having requested attributes" do
        request.blog.should_receive(:new_post).with( post_hash ).and_return post
        result = subject.execute
        result.post.blog.should == request.blog
        result.post.title.should == request.title
        result.post.body.should == request.body
      end
  
      it "should tell the post to publish to its blog" do
        post.should_receive(:publish).and_return true
        subject.execute
      end

      it "should succeed" do
        subject.execute.should be_ok
      end

    end

    context "alternative 1: subscription fails" do
  
      let(:errors){ double "errors" }
      let(:invalid_post_hash){ {
          blog: blog,
          title: "post_title",
          body: "post_body"
      } }
      let(:post){ OpenStruct.new( invalid_post_hash ) }
      let(:request){ Request.new( post ) }
      
      before :each do
        post.stub(:publish => false, :errors => errors)
        request.blog.stub(:new_post => post)
      end
     
      it "should fail" do
        subject.execute.should_not be_ok
      end

      it "should return the errors" do
        subject.execute.errors.should == errors
      end
    
    end
 
  end

end

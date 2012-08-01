require_relative '../post.rb'
describe Post do
  subject {Post.new}
  
  let(:blog){double "blog"}
  let(:title){double "title"}
  let(:body){double "body"}

  context 'initializtion' do
    
    it "should permit you to initialize without a parameter" do
      subject.title.should be_nil
      subject.body.should be_nil
      subject.blog.should be_nil
    end

    it "should permit you to add elements upon initialization" do
      post = Post.new(title: title, body: body, blog: blog)
      post.title.should == title
      post.body.should == body
      post.blog.should == blog
    end

  end

  context 'upon creation' do
    it "should permit you to add a title" do
      subject.title = "foo"
      subject.title.should == "foo"
    end

    it "should permit you to add a body" do
      subject.body = "foo"
      subject.body.should == "foo"
    end


    it "should permit you to add a blog" do
      subject.blog = blog
      subject.blog.should == blog
    end

  end

  context 'after initialization' do
    before :each do
      subject.title = "title"
      subject.body = "body"
      subject.blog = blog
    end

    it "should be publishable" do
      blog.should_receive(:add_entry).with subject
      subject.publish
    end

  end

end

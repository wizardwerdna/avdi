require_relative '../../entities/blog.rb'
require_relative '../../z_repositories/in_memory_repos'

describe Blog do

  before :each do
    Repository.configure ({
      Entry => InMemoryRepos::EntriesRepo.new, 
      Post  => InMemoryRepos::PostsRepo.new
    })
  end

  let(:subject){ Blog.new }
  let(:entry){ double "entry" }

  it "should have the proper title" do
    subject.title.should == "Watching Paint Dry"
  end

  it "should have the proper subtitle" do
    subject.subtitle.should == "The trusted source for drying paint news and opinion"
  end

  context "new blog" do

    it{ should have(0).entries }

    it "should permit you to add new entries" do
      entry.stub(:pubdate)
      subject.add_entry entry
      subject.entries.should == [entry]
    end

  end

  context "post_source" do
    let!(:subject){ Blog.new }
    let(:title){ double "title" }
    let(:body){ double "body" }
    let(:source){ ->(attrs={}){OpenStruct.new(attrs)} }

    before :each do
      subject.post_source = source
    end

    it "should be able to set and retreive a source for posts" do
      subject.post_source.should == source
    end

    it "should create a new post using the post_source" do
      source.should_receive(:call).with(title: title, blog: subject)
      subject.new_post(title: title)
    end

    it "should create a new post with the specified attributes" do
      p = subject.new_post(title: title, body:body)
      p.title == title
      p.body == body
    end

    it "should bind the post to this blog" do 
      subject.new_post.blog.should == subject
    end

    it "should be bound to the blog even if a blog attribute is specified" do
      post = subject.new_post(blog: nil).blog.should == subject
    end

  end

  context "entries" do
    it "should be sorted in by pubdate in reverse order" do
      3.times{|i| subject.add_entry OpenStruct.new(pubdate: i)}
      subject.entries.map(&:pubdate).should == [2,1,0] 
    end

    it "should be limited to 10 elements" do
      11.times{|i| subject.add_entry OpenStruct.new(pubdate: i)}
      subject.entries.map(&:pubdate).should == [10,9,8,7,6,5,4,3,2,1] 
    end
  end

end

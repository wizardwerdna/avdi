require_relative '../../entities/blog.rb'
require_relative '../../z_repositories/in_memory_repos'

describe Blog do

  before :each do
    @entries_repo = InMemoryRepos::EntriesRepo.new
    @posts_repo = InMemoryRepos::PostsRepo.new 
  end
  
  let(:subject){ Blog.new @entries_repo, @posts_repo }
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

  context "creating a new post" do
    let(:title){ double "title" }
    let(:body){ double "body" }

    it "should create a new post with the Post Repository" do
      @posts_repo.should_receive(:new).with(title: title, blog: subject)
      subject.new_post(title: title)
    end

    it "should create a new post with the specified attributes" do
      p = subject.new_post(title: title, body:body)
      p.title.should == title
      p.body.should == body
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

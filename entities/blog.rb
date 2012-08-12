require_relative '../boundaries/repository'
require_relative 'post'
require_relative '../lib/entity'

class Blog < Entity

  attr_accessor :posts_repo, :entries_repo

  def initialize entries_repo = Repository.for(Entry), 
                 posts_repo = Repository.for(Post) 

    self.entries_repo = entries_repo
    self.posts_repo = posts_repo
    super()
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news and opinion"
  end

  def add_entry entry
    entries_repo.add_entry entry
  end

  def new_post attrs = {}
    posts_repo.new attrs.merge(blog: self)
  end

  def entries
    entries_repo.all_reverse_chrono_take10 
  end

end



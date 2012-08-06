require_relative '../boundaries/repository'
require_relative 'post'
require_relative '../lib/entity'

class Blog < Entity

  attr_accessor :post_source

  def initialize
    @entries_repo = Repository.for(Entry)
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news and opinion"
  end

  def add_entry entry
    @entries_repo.add_entry entry
  end

  def new_post attrs = {}
    post_source.call(attrs.merge(blog: self))
  end

  def entries
    @entries_repo.all_reverse_chrono_take10 
  end
end



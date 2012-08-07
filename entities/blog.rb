require_relative '../boundaries/repository'
require_relative 'post'
require_relative '../lib/entity'

class Blog < Entity

  attr_accessor :post_source

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news and opinion"
  end

  def add_entry entry
    Repository.for(Entry).add_entry entry
  end

  def new_post attrs = {}
    post_source.call(attrs.merge(blog: self))
  end

  def entries
    Repository.for(Entry).all_reverse_chrono_take10 
  end
end



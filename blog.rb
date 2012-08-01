require_relative 'post'

class Blog

  attr_accessor :entries, :post_source

  def initialize
    self.entries = []
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news and opinion"
  end

  def add_entry entry
    entries << entry  
  end

  def new_post attrs = {}
    post_source.call(attrs.merge(blog: self))
  end

end



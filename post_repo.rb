class EntriesRepo

  def initialize
    @entries = []
  end

  def add_entry entry
    @entries << entry
  end

  def all
    @entries
  end

  def all_reverse_chrono_take10
    @entries.sort_by(&:pubdate).reverse.take 10
  end

end

class PostsRepo

  def new hash 
    Post.new hash
  end

end

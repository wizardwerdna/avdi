require 'active_record'

module ActiveRecordRepos 

  class PostMap < ActiveRecord::Base
    self.table_name = 'posts'

    attr_accessible :title, :body, :pubdate
  end

  class EntriesRepo

    def initialize blog
      @blog = blog
    end

    def add_entry entry
      PostMap.new(title: entry.title, body: entry.body, pubdate: entry.pubdate).save
    end

    def all
      post_maps_to_posts PostMap.all
    end

    def all_reverse_chrono_take10
      post_maps_to_posts PostMap.order(:pubdate).reverse_order.limit(10)
    end

    private

    def post_maps_to_posts collection
      collection = Array collection
      collection.map{|pm| post = Post.new(title: pm.title, body: pm.body, pubdate: pm.pubdate); post.blog = @blog; post}
    end

  end

  class PostsRepo

    def new hash 
      Post.new hash
    end

  end

end

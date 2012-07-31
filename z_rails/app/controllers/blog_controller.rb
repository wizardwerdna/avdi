class BlogController < ApplicationController
  def index
    @blog = ::Blog::NewBlog[].blog
  end
end

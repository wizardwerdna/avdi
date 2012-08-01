class PostsController < ApplicationController
  def new
    @post = @blog.new_post
  end

  def create
    @post = @blog.new_post params[:post]
    @post.publish
    redirect_to root_url, notice: "Post Added"
  end
  
end

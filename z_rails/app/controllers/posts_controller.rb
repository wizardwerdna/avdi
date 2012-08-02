class PostsController < ApplicationController

  def new
    @post = @blog.new_post
  end

  def create
    @post = @blog.new_post params[:post]
    if @post.publish
      redirect_to root_url, notice: "Post Added"
    else
      render 'new'
    end
  end

end

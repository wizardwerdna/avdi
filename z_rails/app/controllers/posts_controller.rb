class PostsController < ApplicationController

  def new
    @post = NewPost[blog: @blog].post
  end

  def create

    result = PublishPost[ params[:post].merge(blog: @blog) ]
    if result.ok? 
      redirect_to root_url, notice: "Post Added"
    else
      @post = result.post
      render 'new'
    end

  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_blog
    
  def set_blog
    @blog = THE_BLOG
  end
end

class ApplicationController < ActionController::Base
  include ::Interactors
  
  protect_from_forgery

  before_filter :set_blog
    
  def set_blog
    @blog = THE_BLOG
  end
end

require_relative '../lib/interactor.rb'
require_relative '../entities/blog'
module Interactors 

  class NewBlog < Interactor
    def execute
      Response.new(blog: Blog.new)
    end 
  end
  
end


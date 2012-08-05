require_relative '../lib/interactor.rb'
module Interactors 

  class NewBlog < Interactor
    def execute
      Response.new(blog: Blog.new)
    end 
  end
  
end


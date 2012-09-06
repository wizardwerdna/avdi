require_relative '../lib/interactor.rb'
module Interactors 

  class NewPost < Interactor
 
    def run
      raise ArgumentError.new("must specify blog") unless r.blog && r.blog.kind_of?(Blog)
      post = r.blog.new_post(blog: r.blog, title: r.title.to_s, body: r.body.to_s)
      Response.new(blog: r.blog, post: post)
    end
  
  end

end


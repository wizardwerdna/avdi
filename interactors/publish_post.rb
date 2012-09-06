require_relative '../lib/interactor.rb'

module Interactors

  class PublishPost < Interactor

    def run 

      post = r.blog.new_post blog: r.blog, title: r.title, body: r.body 
      if post.publish
        Response.new(post: post)
      else
        Response.new(post: post, errors: post.errors)
      end

    end

  end

end

require 'sinatra'
require_relative '../../application'
require_relative 'application_configuration_ar.rb'

module Bloog
  class Main < Sinatra::Base
    include Interactors

    # List first 10 entries, if any, in reverse chronological order 
    get '/' do
      erb :blog_index, locals: { blog: THE_BLOG }, :layout => :application
    end

    # form for creating a new post
    get '/post/new' do
      post = NewPost[blog: THE_BLOG].post
      erb :post_new, locals: { post: post }, :layout => :application
    end

    # create a new post
    post '/posts' do
      result = PublishPost[ params[:post].merge(blog: THE_BLOG) ]
      if result.ok?
        redirect "/" 
      else
        erb :post_new, locals: { post: result.post }, :layout => :application
      end
    end

  end

end

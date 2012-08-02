require 'sinatra'
require_relative '../application'
require_relative 'application_configuration.rb'

module Bloog

  class Main < Sinatra::Base

    # List first 10 entries, if any, in reverse chronological order 
    get '/' do
      erb :blog_index, locals: { blog: THE_BLOG }, :layout => :application
    end

    # form for creating a new post
    get '/post/new' do
      post = THE_BLOG.new_post
      erb :post_new, locals: { post: post }, :layout => :application
    end

    # create a new post
    post '/posts' do
      entry = THE_BLOG.new_post(params[:post])
      if entry.publish
        redirect "/" 
      else
        erb :post_new, locals: { post: entry }, :layout => :application
      end
    end

  end

end

require_relative '../lib/interactor.rb'

module Interactors

  class PublishPost < Interactor

    def run
      Post.new(r._select :blog_id, :title, :body, :tags).
        publish.
        to_hash
    end 

  end

end

module Bloog 
  require_relative '../application'
  require_relative './application_configuration'

  require ::File.expand_path('../config/environment',  __FILE__)

  class RackResponder

    def call env
      ZRails::Application.call env
    end

  end

end

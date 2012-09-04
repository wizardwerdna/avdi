module Rack
  class RackResponderSelector
    
    attr_accessor :builder, :hash

    def initialize builder, hash
      self.builder = builder
      self.hash = hash
      validate
    end

    def build
      name = rack_responder_name
      path = path_for name 
      puts "Configuring for #{name}"
      builder.instance_eval ::File.read(path)
    end

  private

    def validate
      self.hash = Hash[ hash.map{ |k,v| [k.downcase, v] } ]    
    end

    def rack_responder_name
      name = (ENV["WEB"] || default_rack_responder_name).downcase
      unless hash.keys.include?(name)
        name = hash.keys.first
        puts "no web responder for #{ENV["WEB"]}: using default #{name}"
      end
      name
    end

    def path_for name
      ::File.expand_path "../#{filename_for(name)}", __FILE__
    end

    def filename_for name
      hash.fetch(name)
    end

    def default_rack_responder_name
      hash.keys.first
    end

  end
end

Rack::RackResponderSelector.new(self, {
  "rails_ar" => "z_web/z_rails_ar.ru",
  "rails" => "z_web/z_rails.ru",
  "sinatra_ar" => "z_web/z_sinatra_ar.ru",
  "sinatra" => "z_web/z_sinatra.ru"
}).build

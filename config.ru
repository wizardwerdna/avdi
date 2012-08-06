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
      raise "no web responder for #{ENV["WEB"]}" unless hash.keys.include?(name)
      name
    end

    def path_for name
      ::File.expand_path "../#{filename_for(name)}", __FILE__
    end

    def filename_for name
      hash.fetch(name, hash.keys.first) 
    end

    def default_rack_responder_name
      hash.keys.first
    end

  end
end

Rack::RackResponderSelector.new(self, {
  "rails" => "z_rails.ru",
  "sinatra" => "z_sinatra.ru"
}).build

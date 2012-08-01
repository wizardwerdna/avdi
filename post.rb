require 'ostruct'
require_relative 'lib/entity'

class Post < Entity
  
  attr_accessor :title, :body, :blog 
  attr_reader :pubdate

  def initialize attrs = {}
    @pubdate = nil
    attrs.each {|k,v| send "#{k}=", v}
  end
    
  def publish(clock = DateTime)
    @pubdate = clock.now 
    blog.add_entry self
  end

end

require 'ostruct'
class Post
  
  attr_accessor :title, :body, :blog 

  def initialize attrs = {}
    attrs.each {|k,v| send "#{k}=", v}
  end
    
  def publish
    blog.add_entry self
  end

end

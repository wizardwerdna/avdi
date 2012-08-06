require 'ostruct'
require_relative 'entry'

class Post < Entry
  
  attr_accessor :title, :body, :blog 
  attr_reader :pubdate

  validates :title, presence: true

  def initialize attrs = {}
    @pubdate = nil
    attrs.each {|k,v| send "#{k}=", v}
  end
    
  def publish(clock = DateTime)
    valid? and pubdate_set_and_entry_added?(clock) 
  end

private

  def pubdate_set_and_entry_added? clock
    @pubdate = clock.now
    blog.add_entry self
    true
  end 

end

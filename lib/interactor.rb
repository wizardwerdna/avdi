require_relative 'request'
require_relative 'response'

class Interactor

  attr_reader :r

  def self.[] request = {}
    self.new(request).execute
  end

  def initialize request = {}
    @r = Request.new request 
  end

  def execute
    raise "abstract class instance should not be executed"
  end

end

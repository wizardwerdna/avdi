class Response < OpenStruct

  class NoResponse; end

  def initialize object
    super coerce_to_hash object
  end

  def ok?
    errors.nil?
  end

  private

  def coerce_to_hash object

    case object
      when Hash then object;
      when OpenStruct then object.marshal_dump
      else object.attributes
    end
    
  rescue
    
    raise ArgumentError.new "cannot coerce to Hash: #{object.inspect}"
  
  end

end

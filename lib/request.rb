require 'ostruct'
class Request < OpenStruct

  def initialize hash_coerceable_object = {}
    super coerce_to_hash hash_coerceable_object
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

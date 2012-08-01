require 'active_model'

class Entity
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Naming

  def persisted?
    false
  end
end

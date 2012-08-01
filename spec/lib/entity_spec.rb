require_relative '../../lib/entity'

shared_examples_for "ActiveModel" do
  require 'test/unit/assertions'
  require 'active_model/lint'
  include Test::Unit::Assertions
  include ActiveModel::Lint::Tests

  ActiveModel::Lint::Tests.public_instance_methods.map { |method| method.to_s }.grep(/^test/).each do |method|
    example(method.gsub('_', ' ')) { send method }
  end

  def model
    subject
  end
end

describe Entity do 

  let(:model){Entity.new}

  it_behaves_like "ActiveModel"

end

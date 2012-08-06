require_relative '../../boundaries/repository'

describe Repository do
  
  class Johnson; end
  class TestClass; end
  class TestClass2; end
  class TestClassRepository; end
  class TestClassRepository2; end

  it "does not raise error when requests made before configuration" do
    expect{Repository.for(nil)}.not_to raise_error
    Repository.for(nil).should == Repository::NoRepository
  end

  it "allows configuring classes to repository implementations" do
    Repository.configure TestClass => TestClassRepository
 
    Repository.for(TestClass).should == TestClassRepository
  end

  it "allows adding new classes after the original class" do
    Repository.configure TestClass => TestClassRepository
    Repository.configure TestClass2 => TestClassRepository2
  
    Repository.for(TestClass).should == TestClassRepository
    Repository.for(TestClass2).should == TestClassRepository2
  end

  it "allows strings for configuration instead of classes" do
    Repository.configure "TestClass" => TestClassRepository

    Repository.for(TestClass).should == TestClassRepository
    Repository.for("TestClass").should == TestClassRepository
  end

  it "returns NoRepository if no known repository" do
    Repository.for("Johnson").should == Repository::NoRepository
    Repository.for(Johnson).should == Repository::NoRepository
  end

  it "permits reseting all known repository mappings" do
    Repository.configure "TestClass" => TestClassRepository
    
    Repository.reset!
   
    Repository.for(TestClass).should == Repository::NoRepository
  end

end

require 'ostruct'

shared_examples_for "an indexed repository" do
  specify {expect {subject}.to_not raise_error}
  specify {repo.should be_respond_to :all}
  specify {repo.should be_respond_to :store}
  specify {repo.should be_respond_to :fetch}
  
  context "empty repository" do
  
    it "should have no objects" do
      repo.all.should be_empty
    end
 
    it "should answer NoRecord on any find" do
      repo.fetch(666).should == Repository::NoRecord
    end

    it "should answer #default_key" do
      repo.should be_respond_to :default_key
    end

    it "should answer #default_key=" do
      repo.should be_respond_to :set_default_key
    end

    it "should store and then fetch an unsaved object having a key" do
      repo.set_default_key[data, 1]
      repo.store data
      repo.all.should have(1).item
      repo.fetch(1).should == data
    end

    it "should complain about an a request to store an object without a key" do
    end

    it "should save two objects having dfferent keys" do
      repo.set_default_key[data, 1]
      repo.store data
      data2 = data.clone
      repo.set_default_key[data2, 2]
      repo.store data2 
      repo.all.should have(2).items 
    end

  end

  context "repository with single element" do

    let(:id){repo.default_key[data]}
    let(:new_record_with_same_id){OpenStruct.new different_data: :different_data}

    before :each do
      repo.store data
      repo.set_default_key[new_record_with_same_id, id]
    end

    it "#all should answer a single record" do
      repo.all.should have(1).items
    end

    it "#should permit you to replace an itemi having the same key" do
      repo.store new_record_with_same_id 
      repo.all.should have(1).items
      repo.fetch(id).different_data.should == :different_data
    end
    
  end

end

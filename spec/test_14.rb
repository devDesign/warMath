

describe Footman do

  subject(:footman) { Footman.new }
  subject(:batman) {Unit.new(0,0)}
 
   describe "attack of a dead unit " do
    it "batman cant attack because hes dead" do

      batman.attack!(footman).should eq(nil)
      
    end


  end

end

require_relative 'spec_helper'

describe Footman do

  subject(:footman) { Footman.new }
  subject(:batman) {Footman.new}
 
   describe "hes a dead guy " do
    it "footman.is_dead? after taking a hit! =" do
      footman.health_points = 1
      footman.damage(10)
      footman.is_dead?.should eq(true)
    end


  end

end

require_relative 'spec_helper'

describe Footman do

  subject(:footman) { Footman.new }
 
   describe "foot man is dead " do
    it "footman.is_dead? = true" do
      footman.health_points = 0
      footman.is_dead?.should eq(true)
  end

  end

end

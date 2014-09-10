require_relative 'spec_helper'

describe Footman do

  subject(:footman) { Footman.new }
  subject(:barrack) { Barracks.new }
 
   describe "#attack!" do
    it "footman.attack!(barrack)" do
      footman.attack!(barrack)
      barrack.health_points.should eq(495)
  end

  end

end

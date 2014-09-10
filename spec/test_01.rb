require_relative 'spec_helper'

# Units that can fight, such as the Footman, have both health points to indicate their health and attack power to indicate how much damage they deal to other units
# As such, they must start off with a certain amount of each

describe Footman do

  subject(:footman) { Footman.new }

  it "has and knows its HP (health points)" do
    footman.health_points.should eq(60)
  end

  it "has and knows its AP (attack power)" do
    footman.attack_power.should eq(10)
  end

end

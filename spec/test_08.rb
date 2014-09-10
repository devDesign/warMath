require_relative 'spec_helper'

# Peasants are also units, but they are not soldiers like Footman are
# These guys have other duties like mining for resources (let's not worry about that for now)
# For our intents and purposes, Peasants are just another Unit which have lower HP and no AP (they can't attack other units)

describe Peasant do

  subject(:peasant) { Peasant.new }

  it "has and knows its HP, which is lower than that of a Footman" do
    peasant.health_points.should eq(35)
  end

  it "can't damage other units (no attack power)" do
    peasant.attack_power.should eq(0)
  end

end

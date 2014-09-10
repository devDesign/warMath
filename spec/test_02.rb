require_relative 'spec_helper'

# Resources allow you to create units. In our case (for simplicity), these resources will be stored directly within the barracks

describe Barracks do

  subject(:barracks) { Barracks.new }

  it "starts off with 1000 gold resources" do
    barracks.gold.should eq(1000)
  end

  it "starts off with 80 food resources" do
    barracks.food.should eq(80)
  end



end

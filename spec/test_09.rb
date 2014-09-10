require_relative 'spec_helper'

# Barracks should also be able to train peasants, much like they could train footmen

describe Barracks do

  subject(:barracks) { Barracks.new }

  describe "#train_peasant" do
    it "costs 90 gold" do
      barracks.train_peasant
      barracks.gold.should eq(910) # starts at 1000
    end

    it "costs 5 food" do
      barracks.train_peasant
      barracks.food.should eq(75) # starts at 80
    end

    it "produces a peasant unit" do
      peasant = barracks.train_peasant
      peasant.should be_an_instance_of(Peasant)
    end
  end

  describe "#can_train_peasant?" do
    it "returns true if there are enough resources to train a peasant" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple peasants
      barracks.can_train_peasant?.should eq true
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 4 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      barracks.should_receive(:food).and_return(4)
      barracks.can_train_peasant?.should eq false
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 89 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      barracks.should_receive(:gold).and_return(89)
      barracks.can_train_peasant?.should eq false
    end
  end

  describe "#train_peasant" do
    it "does not train a peasant if there aren't enough resources" do
      barracks.should_receive(:can_train_peasant?).and_return(false)
      barracks.train_peasant.should be_nil
    end
    it "trains a peasant if there are enough resources" do
      barracks.should_receive(:can_train_peasant?).and_return(true)
      barracks.train_peasant.should be_a(Peasant)
    end
  end

end

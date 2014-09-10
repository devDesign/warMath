require_relative 'spec_helper'

# A Barracks should only be able to train footmen if it has enough resources
# Introduce a new method that checks to see if there are enough resources to train one
# Of course, it should then also be leveraged by the train_footman method

describe Barracks do

  subject(:barracks) { Barracks.new }

  describe "#can_train_footman?" do
    it "returns true if there are enough resources to train a footman" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple footmen
      barracks.can_train_footman?.should eq true
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 1 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      barracks.should_receive(:food).and_return(1)
      barracks.can_train_footman?.expect eq(false)
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      barracks.should_receive(:gold).and_return(134)
      barracks.can_train_footman?.expect eq(false)
    end
  end

  describe "#train_footman" do
    it "does not train a footman if there aren't enough resources" do
      barracks.should_receive(:can_train_footman?).and_return(false)
      barracks.train_footman.should be_nil
    end
    it "trains a footman if there are enough resources" do
      barracks.should_receive(:can_train_footman?).and_return(true)
      barracks.train_footman.should be_a(Footman)
    end
  end

end

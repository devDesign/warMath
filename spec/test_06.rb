require_relative 'spec_helper'

# Since a Footman is a type of Unit, it makes sense to now make Footman inherit from Unit
# Furthermore,

# This test doesn't look for it, but there are other things that you could do at this point. Think about what else you could refactor in the Footman class, now that it is inheriting functionality (code) from the Unit class.

describe Footman do

  subject(:footman) { Footman.new }

  it "should be a Unit" do
    footman.should be_an_instance_of(Footman)
    # But should also be a Unit
    footman.should be_a(Unit)
  end

end

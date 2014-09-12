
class Peasant < Unit
  attr_accessor :name, :greeting,:confirm
  def initialize
    @name = "Peasant"
    @greeting = ["Ready to work!","Yes, milord?","What is it?","More work?","What?"]
    @confirm = ["Right-o.","Yes, milord.","All right.","Off I go, then!"]
    @health_points = 35
  end

end

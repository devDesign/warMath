class Town < Building
  attr_reader :name
  def initialize
    @name = "Town Hall"
  end
end
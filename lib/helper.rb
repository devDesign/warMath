def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end 


safely_require 'building'
safely_require 'story'
safely_require 'farms'
safely_require 'menu'
safely_require 'player'
safely_require 'player_buildings'
safely_require 'player_units'
safely_require 'townhall'
safely_require 'unit'
safely_require 'footman'
safely_require 'barracks'
safely_require 'peasant'

safely_require 'game'
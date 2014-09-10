# Helper file to setup our tests/specs for this program.
# NO NEED TO EDIT

require 'pry'
require 'rspec'

def safely_require(file)
  require_relative "../lib/#{file}"
rescue LoadError
  # ignore
end

safely_require 'player'
safely_require 'building'
safely_require 'unit'
safely_require 'footman'
safely_require 'barracks'
safely_require 'peasant'

safely_require 'townhall'
safely_require 'farm'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

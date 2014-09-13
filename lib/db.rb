require 'dm-core'
require 'dm-migrations'

DEBUG = "OFF"

DEBUG == "OFF" ? nil : DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite://' + File.dirname(File.dirname(__FILE__)) + '/db/save_.db')

class PlayerDb
  include DataMapper::Resource
  property :id,         Serial
  property :player, 		Object , :required => true   
end

#KEEP HERE
#DataMapper.auto_migrate!
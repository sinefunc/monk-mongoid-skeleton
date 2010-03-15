ENV['MONGO_DB'] = "app_#{RACK_ENV}"

begin
  require 'sinatra/mongoid'
rescue Mongo::ConnectionFailure
  puts "-----> Warning: You are starting your application without a MongoDB server"
else
  Main.register Sinatra::MongoidExtension
end

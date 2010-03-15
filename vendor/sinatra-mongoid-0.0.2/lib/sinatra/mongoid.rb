require 'sinatra/base'
require 'mongoid'

module Sinatra
  module MongoidExtension
    def self.registered(app)
      app.set :mongo_host,     ENV['MONGO_HOST'] || 'localhost'
      app.set :mongo_db,       ENV['MONGO_DB']   || 'changeme'
      app.set :mongo_port,     ENV['MONGO_PORT'] || Mongo::Connection::DEFAULT_PORT
      app.set :mongo_user,     ENV['MONGO_USER']
      app.set :mongo_password, ENV['MONGO_PASSWORD']

      Mongoid.database = Mongo::Connection.new(app.mongo_host,app.mongo_port).
                                           db(app.mongo_db)
      if app.mongo_user
        Mongoid.database.authenticate(app.mongo_user,
                                      app.mongo_password)
      end
    end
  end

  register MongoidExtension
end

ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require "vendor/dependencies/lib/dependencies"
rescue LoadError
  require "dependencies"
end

require "monk/glue"
require "ohm"
require "haml"
require "sinatra/i18n"

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie
  
  #set :locales, 'config/en.yml'
  register Sinatra::I18n
end

# Connect to redis database.
Ohm.connect(settings(:redis))

# Load all application files.
Dir[root_path("app/**/*.rb")].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Main.run! if Main.run?

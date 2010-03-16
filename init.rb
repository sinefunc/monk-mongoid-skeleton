ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require "vendor/dependencies/lib/dependencies"
rescue LoadError
  require "dependencies"
end

require "monk/glue"
require "haml"

class Main < Monk::Glue
  set :app_file, __FILE__
end

Dir[ "config/initializers/*.rb" ].each { |file| require file }
Dir[ root_path( "app/**/*.rb" ) ].each { |file| require file }

Encoding.default_external = Encoding::UTF_8 if defined? Encoding

Main.run! if Main.run?

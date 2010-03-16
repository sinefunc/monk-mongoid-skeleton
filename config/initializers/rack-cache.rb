require "rack/cache"

class Main 
  configure :development do
    use Rack::Cache, 
      verbose: true, 
      metastore:   "file:tmp/cache/rack",
      entitystore: "file:tmp/cache/rack"
  end

  configure :production do
    use Rack::Cache, 
      verbose: true, 
      metastore:   "memcached://localhost:11211",
      entitystore: "memcached://localhost:11211"
  end
end


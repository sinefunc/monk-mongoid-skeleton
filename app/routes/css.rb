class Main
  get "/css/:stylesheet.css" do |stylesheet|
    last_modified stylesheet_last_modified(stylesheet)
    content_type  :css,    :charset => "UTF-8"
    cache_control :public, :must_revalidate, :max_age => 60

    less :"css/#{stylesheet}"
  end

  helpers do
    def stylesheet_last_modified( name )
      filename = [ params[:stylesheet], 'less' ].join('.')
      path     = root_path('app', 'views', 'css', filename)

      if not File.exist?( path )
        raise Sinatra::NotFound
      end
      
      File.mtime( path )
    end
  end
end

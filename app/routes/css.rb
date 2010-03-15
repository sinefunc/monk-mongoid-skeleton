class Main
  get "/css/:stylesheet.css" do
    content_type "text/css", :charset => "UTF-8"
    less :"css/#{params[:stylesheet]}"
  end
end

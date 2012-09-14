# encoding: UTF-8

require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'sass'
require 'rdiscount'

require './helpers'

get '/' do
  @content = read_markdown("index")
  haml :article
end

get '/:article' do
  @content = read_markdown(params["article"])
  @title = params["article"]
  haml :article
end
  
get '/stylesheets/*' do
  content_type 'text/css'
  sass to_css params[:splat]
end

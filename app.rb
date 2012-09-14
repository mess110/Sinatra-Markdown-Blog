# encoding: UTF-8

require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader' if development?
require 'haml'
require 'sass'
require 'rdiscount'
require 'nokogiri'

get '/' do
  @content = RDiscount.new( File.open("contents/index.md").read ).to_html
  haml :article
end

get '/:article' do
  @content = RDiscount.new( File.open("contents/" + params["article"].gsub("-", "_").concat(".md")).read ).to_html
  @title = params["article"]
  haml :article
end
  
get '/stylesheets/*' do
  content_type 'text/css'
  sass '../styles/'.concat(params[:splat].join.chomp('.css')).to_sym
end

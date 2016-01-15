require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'

get '/' do
  erb :index
end

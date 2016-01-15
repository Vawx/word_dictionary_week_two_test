require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
require 'pry'
also_reload('lib/**/*.rb')

get '/' do
  @words = Word.words
  erb :index
end

get '/word/:id' do
  
end

post '/add_word' do
  new_word = params.fetch('new_word_input')
  new_definition = params.fetch('new_definition_input')
  add_word = Word.new( {"word" => new_word, "definition" => Definition.new( new_definition ) } )
  Word.add(add_word)
  redirect '/'
end

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
  found_word_by_id = Word.get_word_by_id(params[:id])
  if found_word_by_id
    @word = found_word_by_id
  end
  erb :word
end

post '/add_word' do
  new_word = params.fetch('new_word_input')
  new_definition = params.fetch('new_definition_input')
  if new_word.length > 0
    add_word = Word.new( {"word" => new_word, "definition" => Definition.new( new_definition ) } )
    Word.add(add_word)
  end
  redirect '/'
end

post '/add_definition/:id' do
  found_word_by_id = Word.get_word_by_id(params[:id])
  if found_word_by_id
    new_definition = params.fetch("new_definition_input")
    if new_definition.length > 0 && !Word.already_included_definition( found_word_by_id, new_definition )
      found_word_by_id.add_definition( Definition.new(new_definition) )
    end
  end
  redirect '/word/' + params[:id]
end

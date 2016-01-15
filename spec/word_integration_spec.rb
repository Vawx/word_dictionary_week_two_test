require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the word definition path', {:type => :feature} do
  it 'processes the user input for a word and defintiion and stores them' do
    visit '/'
    fill_in 'new_word_input', :with => 'integration'
    fill_in 'new_definition_input', :with => 'an act or instance of combining into an integral whole.'
    click_button 'button'
    expect(page).to have_content 'integration'
    expect(page).to have_content 'an act or instance of combining into an integral whole.'
  end
end

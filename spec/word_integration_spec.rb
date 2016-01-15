require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the word definition path', {:type => :feature} do
  it 'processes the user input for a word and definition and stores them' do
    visit '/'
    fill_in 'new_word_input', :with => 'integration'
    fill_in 'new_definition_input', :with => 'an act or instance of combining into an integral whole.'
    click_button 'button'
    expect(page).to have_content 'integration'
    expect(page).to have_content 'an act or instance of combining into an integral whole.'
  end
  it 'processes the user input for additional word definition' do
    visit '/word/1'
    fill_in 'new_definition_input_on_existing_word', :with => 'an act or instance of integrating a racial, religious, or ethnic group.'
    click_button 'word_button'
    expect(page).to have_content 'an act or instance of integrating a racial, religious, or ethnic group.'
  end
end

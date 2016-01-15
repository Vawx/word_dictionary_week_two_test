require 'rspec'
require 'word'
require 'definition'

describe Word do
  describe '#new_word' do
    it 'creates a new word with definition and name' do
      new_word = Word.new( {"word" => "hello", "definition" => "(Used to express a greeting.)"})
      expect(new_word.word).to(eq("hello"))
      expect(new_word.definition).to(eq(["(Used to express a greeting.)"]))
    end
  end
end

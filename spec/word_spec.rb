require 'rspec'
require 'word'
require 'definition'

describe Word do
  describe '#new_word' do
    it 'creates a new word with definition and name' do
      new_defintion = Definition.new("(Used to express a greetting.)")
      new_word = Word.new( {"word" => "hello", "definition" => new_defintion})
      expect(new_word.word).to(eq("hello"))
      expect(new_word.definition).to(eq([new_defintion]))
    end
  end
end

describe Definition do
  describe "#new_defintion" do
    it 'creates a new defintion' do
      new_defintion = Definition.new("(Used to express a greeting.)")
      expect(new_defintion.definition).to(eq("(Used to express a greeting.)"))
    end
  end
end

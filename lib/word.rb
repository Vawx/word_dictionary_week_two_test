class Word
  attr_reader(:definition, :word)
  define_method(:initialize) do |attributes|
    @definition = [attributes.fetch("definition")]
    @word = attributes.fetch("word")
  end
end

class Word
  attr_reader(:definition, :word, :id)
  @@words = []

  define_method(:initialize) do |attributes|
    @definition = [attributes.fetch("definition")]
    @word = attributes.fetch("word")
    @id = @@words.length + 1
  end

  define_singleton_method(:add) do |word|
    @@words.push(word)
  end

  define_singleton_method(:words) do
    return @@words
  end
end

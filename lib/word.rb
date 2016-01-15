class Word
  attr_reader(:definition, :word, :id)
  @@words = []

  define_method(:initialize) do |attributes|
    @definition = [attributes.fetch("definition")]
    @word = attributes.fetch("word")
    @id = @@words.length + 1
  end

  define_method(:add_definition) do |definition|
    @definition.push(definition)
  end

  define_singleton_method(:add) do |word|
    @@words.push(word)
  end

  define_singleton_method(:words) do
    return @@words
  end

  define_singleton_method(:get_word_by_id) do |id|
    @@words.each do |word|
      if word.id == id.to_i
        return word
      end
    end
    return nil
  end
end

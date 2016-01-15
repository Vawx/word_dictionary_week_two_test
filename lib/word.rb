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

  define_singleton_method(:add) do |new_word|
    found_id = Word.already_included_word(new_word)
    if found_id != -1
      matching_existing_word = Word.get_word_by_id(found_id)
      new_defintion = new_word.definition[ 0 ].definition
      if !already_included_definition(matching_existing_word, new_defintion)
        matching_existing_word.add_definition( Definition.new( new_defintion ) )
      end
    else
      @@words.push(new_word)
      @@words.sort_by!{ |w| w.word.downcase }
    end
  end

  define_singleton_method(:already_included_definition) do |new_word, new_defintion|
    new_word.definition.each do |definition|
      if definition.definition == new_defintion
        return true
      end
    end
    return false
  end

  define_singleton_method(:already_included_word) do |new_word|
    @@words.each do |word|
      if word.word == new_word.word
        return word.id
      end
    end
    return -1
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

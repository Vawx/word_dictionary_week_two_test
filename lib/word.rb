class Word
  attr_reader(:definitions, :name)
  define_method(:initialize) do |attributes|
    @definitions.push(attributes.fetch("definition"))
    @name = attributes.fetch("name")
  end
end

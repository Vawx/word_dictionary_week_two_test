class Definition
  attr_reader(:definition)
  define_method(:initialize) do |definition|
    @definition = definition
  end
end

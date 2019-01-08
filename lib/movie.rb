class Movie < Product
  def initialize(options)
    super
    @director = options[:director]
    @year = options[:year]
  end

  def output
    puts "Фильм #{@title}, #{@year}, реж. #{@director}, #{super}"
  end
end

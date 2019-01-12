class Movie < Product
  attr_accessor :year, :director

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }
    self.new(
        title: lines[0],
        director: lines[1],
        year: lines[2],
        price: lines[3].to_i,
        balance: lines[4].to_i
    )
  end

  def initialize(options)
    super
    @director = options[:director]
    @year = options[:year]
  end

  def output
    "Фильм #{@title}, #{@year}, реж. #{@director}, #{super}"
  end

  def update(options)
    super
    @director = options[:director] if options[:director]
    @year = options[:year] if options[:year]
  end
end

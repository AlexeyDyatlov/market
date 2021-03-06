class Book < Product
  attr_accessor :genre, :author

  def initialize(options)
    super
    @genre = options[:genre]
    @author = options[:author]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }
    self.new(
    title: lines[0],
    genre: lines[1],
    author: lines[2],
    price: lines[3].to_i,
    balance: lines[4].to_i
    )
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def update(options)
    super
    @genre = options[:genre] if options[:author]
    @author = options[:author] if options[:author]
  end
end

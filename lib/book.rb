class Book < Product
  def initialize(options)
    super
    @genre = options[:genre]
    @author = options[:author]
  end
  def output
    puts "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end
end

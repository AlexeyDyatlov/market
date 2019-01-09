if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'

current_path = __dir__

films = []
film_files = Dir.glob("#{__dir__}/data/films/*.txt").to_a
film_files.each do |file_name|
  lines = File.readlines(file_name)
  films << lines
end
puts films

puts "Можем предложить: "
puts
#cart.each { |item| puts item.output}
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
require_relative 'lib/product_collection.rb'

current_path = __dir__

collection = ProductCollection.from_dir(current_path + '/data')
collection.sort!(by: :title, order: :asc)

collection.to_a.each do |item|
  puts item
end

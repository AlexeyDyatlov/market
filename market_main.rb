if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/purchase'

current_path = __dir__

collection = ProductCollection.from_dir(current_path + '/data')
collection.sort!(by: :title, order: :asc)

items = []

collection.to_console.each_with_index do |item, index|
  items << item
end

user_purchase = Purchase.new(items)
user_purchase.add_to_cart
user_purchase.user_cart











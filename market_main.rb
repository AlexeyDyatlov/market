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

collection.to_a.each do |item|
  items << item
end

user_purchase = Purchase.new(items)
user_input = nil

until user_input == 0
  puts "\nЧто хотите купить?\n\n"
  user_purchase.products_to_s
  puts "0. Выход"
  user_input = STDIN.gets.to_i
  user_purchase.add_to_cart(user_input)
  break if user_input == 0

  unless user_purchase.cart_empty?
    puts "Ваша корзина: "
  end

  user_purchase.user_cart_to_s
end

unless user_purchase.cart_empty?
  puts "\nВы выбрали: "
  user_purchase.user_cart_to_s
  puts "\nТоваров на сумму: #{user_purchase.sum} руб. Спасибо за покупку!"
else
  puts "\nВы ничего не купили. Больше не приходите!"
end

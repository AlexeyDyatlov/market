require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'

cart = []
cart << Movie.new(price: 290, balance: 4, title: "Дурак", year: 2014, director: "Юрий Быков")
cart << Movie.new(price: 458, balance: 1, title: "Leon", year: 1994, director: "Luc Besson")
cart << Book.new(price: 350, balance: 2, title: "Любовь живет три года", author: "Frederic Begbeder", year: 1997)

cart[1].price = 990

puts "Можем предложить: "
puts
cart.each { |item| puts item.output}
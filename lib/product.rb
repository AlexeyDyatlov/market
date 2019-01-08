class Product
  attr_accessor :price, :balance
  def initialize(options)
    @title = options[:title]
    @price = options[:price]
    @balance = options[:balance]
  end

  def output
    "#{@price} руб. осталось #{@balance} шт."
  end

end

class Purchase
  attr_accessor :cart, :items, :sum
  def initialize(items)
    @items = items
    @sum = 0
    @cart = []
    @count_arr = []
    @quantity = {}
    @user_choise = nil
  end

  def add_to_cart(user_input)
    @user_choise = user_input
    if @user_choise.between?(0, @items.size) && @items[@user_choise - 1].balance > 0
      return if @user_choise == 0
      @items[@user_choise -1].balance -= 1
      @sum += @items[@user_choise - 1].price
      @cart << @items[@user_choise -1]
      self.count
    else
      puts "\nТакого товара у нас нет\n"
    end
  end

  def cart_empty?
    @cart.empty?
  end

  def products_to_s
    @items.each_with_index { |item, index| puts "#{index + 1}.#{item}" }
  end

  def user_cart_to_s
    @cart.uniq.each_with_index { |item, index| puts "#{index + 1}. #{item} В количестве: #{@count_arr[index]} шт."}
  end

  def count
    @cart.each do |item|
      count = @cart.count(item)
      @quantity[item] = count
    end
    @count_arr = @quantity.values
  end
end

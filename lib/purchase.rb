class Purchase

  def initialize(items)
    @items = items
    @sum = 0
    @cart = []
    @user_choise = nil
  end

  def add_to_cart
    while @user_choise != 0 do
      puts "Что хотите купить?"
      puts
      @items.each_with_index { |item, index| puts "#{index + 1}.#{item.output} 0. Выход" }
      puts "0. Выход"
      @user_choise = STDIN.gets.chomp.to_i
      return if @user_choise == 0

      if @user_choise.between?(0, @items.size) && @items[@user_choise - 1].balance > 0
        @items[@user_choise -1].balance -= 1
        @sum += @items[@user_choise - 1].price
        @items[@user_choise - 1].quantity += 1
        unless @cart.include?(@items[@user_choise - 1])
          @cart << @items[@user_choise -1]
        end
      else
        puts "\nТакого товара нет!"
      end

      puts "\nВы выбрали: "
      @cart.each_with_index { |item, index| puts"#{index + 1}. #{item.output} В количестве: #{item.quantity} шт."}
      puts "Товаров на сумму: #{@sum} руб."
    end
  end

  def user_cart
    puts "\nВы купили:"
    @cart.uniq!
    @cart.each{ |i| puts "#{i.output} - #{i.quantity}шт." }
    puts "С вас: #{@sum}руб. Спасибо за покупку!"
  end
end

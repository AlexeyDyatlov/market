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

  def update(options)
    @price = options[:price] if options[:price]
    @balance = options[:balance] if options[:balance]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end

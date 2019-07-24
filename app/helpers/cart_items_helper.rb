module CartItemsHelper

  def stock_array_maker(stock)
    current_stock_array = []
    stock.times do |number|
      current_stock_array << number + 1
  end
  current_stock_array
  end

  

end

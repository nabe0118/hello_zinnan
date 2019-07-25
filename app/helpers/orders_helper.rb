module OrdersHelper

  def calculate_sum(carts)
    sum = 0
    carts.each do |cart|
     sum = sum + (cart.cd.price * 1.08 * cart.number).ceil
    end
    sum
  end

end

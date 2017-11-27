json.total_cost @order_facade.total_cost

json.orders @order_facade.orders.each do |order|
  json.order @order_facade.meals(order)
end

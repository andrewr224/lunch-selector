class Api::V1::OrdersController < ApiApplicationController
  def index
    @order_facade = Order::OrderFacade.new
  end
end

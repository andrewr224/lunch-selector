class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.menu_id = params[:menu_id]

    @order.save
    redirect_to menu_path(@order.menu)
  end
end

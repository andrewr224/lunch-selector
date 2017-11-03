class OrdersController < ApplicationController
  def create
    order = Order::Create.call(
      params: params,
      menu:   menu
    )

    flash.notice = order ? 'Order Placed!' : 'Order Failed!'

    redirect_to menu
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end

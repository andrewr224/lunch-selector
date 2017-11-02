class OrdersController < ApplicationController
  def create
    order = Order::Create.call(
      params: params,
      menu:   menu
    )

    if order
      flash[:notice] = 'Order Placed!'
    else
      flash[:error] = 'Order Failed!'
    end
    redirect_to menu
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end

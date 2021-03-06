class OrdersController < ApplicationController
  load_and_authorize_resource

  def create
    Order::Create.call(
      params: order_params,
      user:   current_user,
      menu:   menu
    )

    redirect_to menu
  end

  def edit
    @order ||= Order.find_by(id: params[:id])
  end

  def update
    Order::Update.call(
      id:     params[:id],
      params: order_params,
      menu:   menu
    )

    notify(:notice, t('controllers.orders.flash.update'))
    redirect_to menu
  end

  def destroy
    Order::Destroy.call(params[:id])

    notify(:notice, t('controllers.orders.flash.destroy'))
    redirect_to menu
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def order_params
    params.require(:order).permit(order_items_attributes: %i[meal_id])
  end
end

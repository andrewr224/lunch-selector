class OrdersController < ApplicationController
  def create
    order = Order::Create.call(
      params: order_params,
      menu:   menu
    )

    notify(:notice, "#{t('flash.order_created')}!") if order

    redirect_to menu
  end

  def destroy
    @order ||= Order.find_by(id: params[:id])

    @order.destroy

    notify(:notice, "#{t('flash.order_deleted')}!")
    redirect_back(fallback_location: root_path)
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def order_params
    params.fetch(:order, {}).permit(order_items_attributes: %i[meal_id])
  end
end

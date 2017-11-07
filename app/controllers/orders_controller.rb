class OrdersController < ApplicationController
  def create
    order = Order::Create.call(
      params: params,
      menu:   menu
    )

    notify(:notice, "#{t('flash.order_created')}!") if order

    redirect_to menu
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end

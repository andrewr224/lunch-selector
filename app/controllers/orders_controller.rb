class OrdersController < ApplicationController
  def create
    Order::Creator.call(
      params: params,
      menu:   menu
    )

    redirect_back fallback_location: root_path
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end

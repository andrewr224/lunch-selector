class Order
  class Update < ApplicationService
    def initialize(params = {})
      @id     = params[:id]
      @menu   = params[:menu]
      @params = params[:params]
    end

    def call
      order.order_items.delete_all
      order.update(params)
    end

    private

    attr_reader :id, :params, :menu

    def order
      @order ||= Order.find_by(id: id)
    end
  end
end

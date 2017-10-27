class Order
  class Creator < ApplicationService
    def initialize(params = {})
      @menu = params[:menu]
    end

    def call
      order.save
      order
    end

    private

    attr_reader :menu

    def order
      @order ||= menu.orders.new
    end
  end
end

class Order
  class Create < ApplicationService
    def initialize(params = {})
      @menu = params[:menu]
    end

    def call
      order if order.save
    end

    private

    attr_reader :menu

    def order
      @order ||= menu.orders.new
    end
  end
end

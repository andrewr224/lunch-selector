class Order
  class Create < ApplicationService
    def initialize(params = {})
      @params = params[:params]
      @menu   = params[:menu]
    end

    def call
      order.tap { |o| o.save }
    end

    private

    attr_reader :params, :menu

    def order
      @order ||= menu.orders.new(params)
    end
  end
end

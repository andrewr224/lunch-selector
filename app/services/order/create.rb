class Order
  class Create < ApplicationService
    def initialize(params = {})
      @params = params[:params]
      @menu   = params[:menu]
    end

    def call
      return order if order.save
    end

    private

    attr_reader :params, :menu

    def order
      @order ||= menu.orders.new(params)
    end
  end
end

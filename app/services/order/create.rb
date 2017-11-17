class Order
  class Create < ApplicationService
    def initialize(params = {})
      @params = params[:params]
      @menu   = params[:menu]
      @user   = params[:user]
    end

    def call
      ActiveRecord::Base.transaction do
        build_order
      end
    end

    private

    attr_reader :params, :menu, :user

    def build_order
      order = menu.orders.create(params)
      user.orders << order
      order
    end
  end
end

class Order
  class Create < ApplicationService
    def initialize(params = {})
      @params = params[:params]
      @menu   = params[:menu]
      @user   = params[:user]
    end

    def call
      menu.orders.create(params.merge(user: user))
    end

    private

    attr_reader :params, :menu, :user
  end
end

class Order
  class Destroy < ApplicationService
    def initialize(id)
      @id = id
    end

    def call
      order.destroy
    end

    private

    attr_reader :id

    def order
      @order ||= Order.find_by(id: id)
    end
  end
end

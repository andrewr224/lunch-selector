require 'rails_helper'

RSpec.describe OrderDecorator do
  subject(:order) { Order.create(menu: Menu.new).decorate }

  describe '#stamp' do
    it 'returns a string' do
      expect(order.stamp).to be_a String
    end
  end
end

require 'rails_helper'

RSpec.describe OrderDecorator do
  subject(:order) { Order.create(menu: create(:menu)).decorate }

  describe '#stamp' do
    it 'returns a string' do
      expect(order.stamp).to be_a String
    end
  end
end

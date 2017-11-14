require 'rails_helper'

RSpec.describe OrderDecorator do
  subject(:order) { create(:order).decorate }

  describe '#stamp' do
    it 'returns a string' do
      expect(order.stamp).to be_a String
    end
  end
end

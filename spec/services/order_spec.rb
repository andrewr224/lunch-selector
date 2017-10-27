require 'rails_helper'

RSpec.describe Meal do
  let(:params) do
    { menu: Menu.create(id: 1) }
  end

  describe 'Creator' do
    subject(:order) { Order::Creator.call(params) }
    it 'creates an order' do
      is_expected.to be_an Order
    end
  end
end

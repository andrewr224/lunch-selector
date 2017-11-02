require 'rails_helper'

RSpec.describe Order do
  let(:params) do
    { menu: Menu.create }
  end

  describe 'Create' do
    subject(:order) { Order::Create.call(params) }
    it 'creates an order' do
      is_expected.to be_an Order
    end
  end
end

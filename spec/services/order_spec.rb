require 'rails_helper'

RSpec.describe Order::Create do
  subject { described_class.call(menu: build(:menu)) }

  it { is_expected.to be_an Order }
end

RSpec.describe Order::Update do
  let(:menu) { create(:menu, :with_orders) }
  let(:order_id) { menu.orders.first.id }
  let(:form_params) do
    { order_items_attributes:
      { '0' => { meal_id: menu.meals[0].id },
        '1' => { meal_id: menu.meals[1].id },
        '2' => { meal_id: menu.meals[2].id } } }
  end

  let(:params) do
    { id:     order_id,
      menu:   menu,
      params: form_params }
  end

  it { expect(described_class.call(params)).to be_truthy }
end

RSpec.describe Order::Destroy do
  let(:order) { build(:order) }

  before { order.save }

  it 'deletes an order' do
    expect { described_class.call(order.id) }.to change(Order, :count).by(-1)
  end
end

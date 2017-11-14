require 'rails_helper'

RSpec.describe Order::Create do
  subject { described_class.call(menu: build(:menu)) }

  it { is_expected.to be_an Order }
end

RSpec.describe Order::Update do
  let(:order) { build(:order) }
  let(:params) do
    { id:     order.id,
      menu:   order.menu,
      params: attributes_for(:order_item) }
  end

  xit 'updates an order' do
    expect(described_class.call(params)).to eq(42)
  end
end

RSpec.describe Order::Destroy do
  let(:order) { build(:order) }

  before do
    order.save
  end

  it 'deletes an order' do
    expect { described_class.call(order.id) }.to change(Order, :count).by(-1)
  end
end

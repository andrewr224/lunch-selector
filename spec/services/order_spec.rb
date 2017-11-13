require 'rails_helper'

RSpec.describe Order::Create do
  let(:menu) { create(:menu) }
  subject { described_class.call(menu: menu) }

  it { is_expected.to be_an Order }
end

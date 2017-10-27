require 'rails_helper'

RSpec.describe Menu do
  let(:params) { { id: 1 } }
  before do
    Menu.create(params)
  end

  describe 'Show' do
    subject(:menu_show) { Menu::Show.call(params) }
    it 'returns values in a Hash' do
      is_expected.to be_a Hash
    end

    it 'returns a meal as a Hash value' do
      expect(menu_show[:meal]).to be_a Meal
    end

    it 'returns an order as a Hash value' do
      expect(menu_show[:order]).to be_a Order
    end

    it 'returns a menu as a Hash value' do
      expect(menu_show[:menu]).to be_a Menu
    end

    context 'when there is no record' do
      subject(:menu_show) { Menu::Show.call(id: 2) }
      it do
        is_expected.to be_nil
      end
    end
  end
end

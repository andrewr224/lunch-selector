require 'rails_helper'

RSpec.describe Menu do
  subject(:menu) { Menu::Create.call }
  describe 'Create' do
    it 'creates a menu' do
      is_expected.to be_a Menu
    end
  end

  describe 'Delete' do
    let!(:menu) { Menu::Create.call }
    let(:params) { { id: menu[:id] } }
    it 'deletes a menu' do
      expect(Menu.all.count).to eq(1)
      Menu::Destroy.call(params)
      expect(Menu.all.count).to eq(0)
    end
  end
end

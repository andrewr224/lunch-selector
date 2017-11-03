require 'rails_helper'

RSpec.describe Menu do
  describe 'Delete' do
    let!(:menu) { Menu.create }
    let(:id) { menu[:id] }

    it 'deletes a menu' do
      expect { Menu::Destroy.call(id) }.to change(Menu, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe Menu::Destroy do
  let!(:menu) { create(:menu) }

  it 'deletes a menu' do
    expect { Menu::Destroy.call(menu.id) }.to change(Menu, :count).by(-1)
  end
end

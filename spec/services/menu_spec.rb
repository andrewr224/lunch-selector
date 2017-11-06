require 'rails_helper'

RSpec.describe Menu::Destroy do
  let!(:menu) { Menu.create }
  let(:id) { menu[:id] }

  it 'deletes a menu' do
    expect { Menu::Destroy.call(id) }.to change(Menu, :count).by(-1)
  end
end

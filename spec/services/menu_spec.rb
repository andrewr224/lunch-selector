require 'rails_helper'

RSpec.describe Menu::Create do
  let(:user) { create(:user) }

  def create_menu
    described_class.call(user)
  end

  it 'creates a menu' do
    expect { create_menu }.to change(Menu, :count).by(1)
  end
end

RSpec.describe Menu::Destroy do
  let(:menu) { build(:menu) }

  before do
    menu.save
  end

  it 'deletes a menu' do
    expect { Menu::Destroy.call(menu.id) }.to change(Menu, :count).by(-1)
  end
end

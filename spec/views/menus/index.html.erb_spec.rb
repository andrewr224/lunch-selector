require 'spec_helper'

RSpec.describe 'menus/index.html.erb', type: :view do
  it 'displays menu list' do
    assign(:menus, [Menu.create(id: 1, created_at: Time.now),
                    Menu.create(id: 2, created_at: Time.now)])

    render

    expect(rendered).to have_content '2017'
  end
end

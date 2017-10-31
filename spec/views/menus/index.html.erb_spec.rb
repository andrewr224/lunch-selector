require 'spec_helper'

RSpec.describe 'menus/index.html.erb', type: :view do
  it 'displays menu list' do
    assign(:menus, [Menu.create,
                    Menu.create])

    render

    expect(rendered).to have_content '2017'
  end
end

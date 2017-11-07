require 'rails_helper'

RSpec.describe MenuDecorator do
  subject(:menu) { create(:menu).decorate }

  describe '#day_stamp' do
    it 'returns a string' do
      expect(menu.day_stamp).to be_a String
    end
  end
end

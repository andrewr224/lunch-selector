require 'rails_helper'

RSpec.describe Menu::MenuFacade do
  let(:menu) { create(:menu) }

  subject { described_class.new(menu) }

  it 'still has a menu object' do
    expect(subject.menu).to be_a Menu
  end

  context 'when menu has no meals' do
    it { expect(subject.courses[0]).to be_empty }
  end

  context 'when menu has meals' do
    let(:menu) { create(:menu, :with_meals) }

    it { expect(subject.courses[0]).not_to be_empty }
  end
end

RSpec.describe Menu::ShowFacade do
  let(:menu) { create(:menu, :with_orders) }

  subject { described_class.new(menu) }

  describe '#new_order' do
    it { expect(subject.new_order).to be_an Order }
  end

  context 'when has orders' do
    describe '#total_cost' do
      it { expect(subject.total_cost).to be_an Integer }
    end
  end
end

RSpec.describe Menu::EditFacade do
  let(:menu) { create(:menu) }

  subject { described_class.new(menu) }

  describe '#new_meal' do
    it { expect(subject.new_meal).to be_a MealForm }
  end
end

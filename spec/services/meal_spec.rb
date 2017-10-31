require 'rails_helper'

RSpec.describe Meal do
  let(:params) do
    { params: { name: 'pizza',
                course: 'main course',
                price: 42 },
      menu: Menu.create }
  end

  describe 'Creator' do
    subject(:meal) { Meal::Creator.call(params) }
    it 'creates a meal' do
      is_expected.to be_a Meal
    end

    describe 'meal' do
      it 'is a pizza' do
        expect(meal.name).to eq('pizza')
      end

      it 'is a main course' do
        expect(meal.course).to eq('main course')
      end

      it 'has price 42' do
        expect(meal.price).to eq(42)
      end
    end
  end
end

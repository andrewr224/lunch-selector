require 'rails_helper'

RSpec.describe Meal, type: :model do
  let(:params) { { name: 'pizza', course: 'main course', price: 42 } }
  context 'when presented with valid data' do
    it 'saves the meal' do
      meal = Meal.create(params)
      expect(meal).to be_a Meal
    end
  end
  context 'when data is invalid' do
    it 'ensures name is present' do
      meal = Meal.create(params.merge(name: nil)).save
      expect(meal).to eq(false)
    end

    it 'ensures course is present' do
      meal = Meal.create(params.merge(course: nil)).save
      expect(meal).to eq(false)
    end

    it 'ensures price is present' do
      meal = Meal.create(params.merge(price: nil)).save
      expect(meal).to eq(false)
    end
  end
end

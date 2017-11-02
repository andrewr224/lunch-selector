require 'rails_helper'

RSpec.describe 'MealForm' do
  let(:params) { { name: 'pizza', course: 'main course', price: 42 } }
  it 'validats properly filled params' do
    form = MealForm.new(Meal.new)

    form.validate(params)

    expect(form.errors[:title]).to be_empty
  end

  it 'requires meal name' do
    form = MealForm.new(Meal.new)

    form.validate({})

    expect(form.errors[:name]).to include('can\'t be blank')
  end

  it 'requires meal to have specified course' do
    form = MealForm.new(Meal.new)

    form.validate({})

    expect(form.errors[:course]).to include('can\'t be blank')
  end

  it 'requires meal price' do
    form = MealForm.new(Meal.new)

    form.validate({})

    expect(form.errors[:price]).to include('can\'t be blank')
  end
end

require 'rails_helper'

RSpec.describe 'MealForm' do
  let(:params) { { name: 'pizza', course: 'main course' } }
  subject(:form) { MealForm.new(Meal.new) }

  it 'validats properly filled params' do
    form.validate(params)
    expect(form.errors[:title]).to be_empty
  end

  it 'requires meal to have specified course' do
    form.validate(params.merge(course: nil))
    expect(form.errors[:course]).to include("can't be blank")
  end

  it 'requires meal name' do
    form.validate(params.merge(name: nil))
    expect(form.errors[:name]).to include("can't be blank")
  end

  context 'when name is too short' do
    it 'is not valid' do
      form.validate(params.merge(name: 'av'))
      expect(form.errors[:name].first).to include('too short')
    end
  end

  context 'when name is too long' do
    it 'is not valid' do
      form.validate(params.merge(name: 'very long and cumbersome name'))
      expect(form.errors[:name].first).to include('too long')
    end
  end
end

require 'rails_helper'

RSpec.describe MealForm do
  let(:params) do
    { meal:      attributes_for(:meal),
      menu_item: { price: 15 } }
  end

  subject do
    described_class.new(
      meal: build(:meal),
      menu_item: build(:menu_item)
    )
  end

  it 'validats properly filled params' do
    subject.validate(params)
    expect(subject.errors[:title]).to be_empty
  end

  it 'requires meal to have specified course' do
    subject.validate(params.merge(course: nil))
    expect(subject.errors[:course]).to include("can't be blank")
  end

  it 'requires meal name' do
    subject.validate(params.merge(name: nil))
    expect(subject.errors[:name]).to include("can't be blank")
  end

  context 'when name is too short' do
    it 'is not valid' do
      subject.validate(params.merge(name: 'av'))
      expect(subject.errors[:name].first).to include('too short')
    end
  end

  context 'when name is too long' do
    it 'is not valid' do
      subject.validate(params.merge(name: 'very long and cumbersome name'))
      expect(subject.errors[:name].first).to include('too long')
    end
  end

  it 'requires price' do
    subject.validate(params.merge(price: nil))
    expect(subject.errors[:price]).not_to be_empty
  end

  context 'when price is 0' do
    it 'is not valid' do
      subject.validate(params.merge(price: 0))
      expect(subject.errors[:price]).not_to be_empty
    end
  end
end

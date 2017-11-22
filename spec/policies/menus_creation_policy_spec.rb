require 'rails_helper'

RSpec.describe MenusCreationPolicy do
  subject { described_class.new }

  context 'when there are no menus' do
    it { expect(subject.allowed?).to be true }
  end

  context 'when there are no menu published today' do
    before { create(:menu, created_at: Time.now - 86_400) }

    it { expect(subject.allowed?).to be true }
  end

  context 'when there are menu published today' do
    before { create(:menu) }

    it { expect(subject.allowed?).to be false }
  end
end

require 'rails_helper'

RSpec.describe MenuPolicy do
  subject { described_class.new(menu) }

  context 'when there are no menus' do
    let(:menu) { nil }

    it { expect(subject.allow_placement?).to be true }
  end

  context 'when there are no menu published today' do
    let(:menu) { create(:menu, created_at: Time.now - 86_400) }

    it { expect(subject.allow_placement?).to be true }
  end

  context 'when there are menu published today' do
    let(:menu) { create(:menu) }

    it { expect(subject.allow_placement?).to be false }
  end

  context "when it's today's menu" do
    let(:menu) { create(:menu) }

    it { expect(subject.allow_modification?).to be true }
  end

  context "when it's not today's menu" do
    let(:menu) { create(:menu, created_at: Time.now - 86_400) }

    it { expect(subject.allow_modification?).to be false }
  end
end

require 'rails_helper'

RSpec.describe CurrentDayPolicy do
  subject { described_class.new(menu) }

  context "when it's today's menu" do
    let(:menu) { create(:menu) }

    it { expect(subject.allowed?).to be true }
  end

  context "when it's not today's menu" do
    let(:menu) { create(:menu, created_at: Time.now - 86_400) }

    it { expect(subject.allowed?).to be false }
  end
end

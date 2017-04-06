require 'spec_helper'

RSpec.describe RGBUtils::Color do
  describe '#coerce' do
    context 'when value is a string' do
      let(:object) { Virtus::Attribute.build(described_class, {}) }

      subject { object.coerce('10') }

      it { is_expected.to eq(10) }
    end

    context 'when passed value is lower than MIN_VALUE' do
      let(:object) { Virtus::Attribute.build(described_class, {}) }

      subject { object.coerce(-1) }

      it { is_expected.to eq(described_class::MIN_VALUE) }
    end

    context 'when passed value is greater than MAX_VALUE' do
      let(:object) { Virtus::Attribute.build(described_class, {}) }

      subject { object.coerce(300) }

      it { is_expected.to eq(described_class::MAX_VALUE) }
    end

    context 'when passed value is between MIN_VALUE and MAX_VALUE' do
      let(:object) { Virtus::Attribute.build(described_class, {}) }

      subject { object.coerce(100) }

      it { is_expected.to eq(100) }
    end
  end
end

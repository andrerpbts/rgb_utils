require 'spec_helper'

RSpec.describe RGBUtils::HexToRGBConverter do
  describe '#convert' do
    context 'when a hex color is given' do
      let(:color) { '#ffca2e' }

      subject { described_class.new(color).convert }

      it { is_expected.to be_a(RGBUtils::RGB) }
      it { expect(subject.red).to eq(255) }
      it { expect(subject.green).to eq(202) }
      it { expect(subject.blue).to eq(46) }
    end

    context 'when a rgb color is given' do
      let(:color) { RGBUtils::RGB.new }

      subject { described_class.new(color).convert }

      it { is_expected.to eq(color) }
    end
  end
end

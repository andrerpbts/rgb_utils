require 'spec_helper'

RSpec.describe RGBUtils::RGBToLinearRGBConverter do
  describe '#convert' do
    context 'when a rgb object is given' do
      let(:rgb) { RGBUtils::RGB.new(red: 255, green: 202, blue: 46) }

      subject { described_class.new(rgb).convert }

      it { is_expected.to be_a(RGBUtils::LinearRGB) }
      it { expect(subject.red).to eq(1.0) }
      it { expect(subject.green).to eq(0.5906188409193369) }
      it { expect(subject.blue).to eq(0.027320891639074894) }
    end

    context 'when a hex color is given' do
      let(:color) { '#ffcae2' }

      subject { described_class.new(color).convert }

      it { is_expected.to be_a(RGBUtils::LinearRGB) }
      it { expect(subject.red).to eq(1.0) }
      it { expect(subject.green).to eq(0.5906188409193369) }
      it { expect(subject.blue).to eq(0.7605245046752924) }
    end
  end
end

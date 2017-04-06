require 'spec_helper'

RSpec.describe RGBUtils::RGBToHexConverter do
  describe '#convert' do
    context 'when a rgb color is given' do
      let(:color) { RGBUtils::RGB.new(red: 255, green: 0, blue: 0) }

      subject { described_class.new(color).convert }

      it { is_expected.to eq('#ff0000') }
    end

    context 'when a hex color is given' do
      let(:color) { '#ffcc00' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq('#ffcc00') }
    end

    context 'when a web safe hex color is given' do
      let(:color) { '#fc0' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq('#ffcc00') }
    end
  end
end

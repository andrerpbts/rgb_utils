require 'spec_helper'

RSpec.describe RGBUtils::WebSafeToHexConverter do
  describe '#convert' do
    context 'when a valid web safe hex is given' do
      let(:color) { '#fc0' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq('#ffcc00') }
    end

    context 'when a valid full hex color is given' do
      let(:color) { '#faca0a' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq('#faca0a') }
    end

    context 'when an incomplete hex color is given' do
      let(:color) { 'f0ab' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq(described_class::DEFAULT_COLOR) }
    end

    context 'when an invalid color is given' do
      let(:color) { 'foo' }

      subject { described_class.new(color).convert }

      it { is_expected.to eq(described_class::DEFAULT_COLOR) }
    end
  end
end

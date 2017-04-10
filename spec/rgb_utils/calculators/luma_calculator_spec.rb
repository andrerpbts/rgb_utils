require 'spec_helper'

RSpec.describe RGBUtils::LumaCalculator do
  describe '#calculate' do
    context 'for black color' do
      let(:rgb) { RGBUtils::RGB.new(red: 0, green: 0, blue: 0) }

      subject { described_class.new(rgb).calculate }

      it { is_expected.to eq(0.0) }
    end

    context 'for white color' do
      let(:rgb) { RGBUtils::RGB.new(red: 255, green: 255, blue: 255) }

      subject { described_class.new(rgb).calculate }

      it { is_expected.to eq(1.0) }
    end

    context 'for red color' do
      let(:rgb) { RGBUtils::RGB.new(red: 255, green: 0, blue: 0) }

      subject { described_class.new(rgb).calculate }

      it { is_expected.to eq(0.299) }
    end

    context 'for green color' do
      let(:rgb) { RGBUtils::RGB.new(red: 0, green: 255, blue: 0) }

      subject { described_class.new(rgb).calculate }

      it { is_expected.to eq(0.587) }
    end

    context 'for blue color' do
      let(:rgb) { RGBUtils::RGB.new(red: 0, green: 0, blue: 255) }

      subject { described_class.new(rgb).calculate }

      it { is_expected.to eq(0.114) }
    end

    context 'when a hex color is given' do
      let(:color) { '#eeccbb' }

      subject { described_class.new(color).calculate }

      it { is_expected.to eq(0.8322666666666666) }
    end
  end
end

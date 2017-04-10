require 'spec_helper'

RSpec.describe RGBUtils::ComplexContrastColorResolver do
  describe '#for' do
    let(:dark_color) { RGBUtils::Config.dark_color }
    let(:light_color) { RGBUtils::Config.light_color }

    context 'for red background' do
      let(:rgb) { RGBUtils::RGB.new(red: 255, green: 0, blue: 0) }

      subject { described_class.new(rgb).for }

      it { is_expected.to eq(dark_color) }
    end
    context 'for green background' do
      let(:rgb) { RGBUtils::RGB.new(red: 0, green: 255, blue: 0) }

      subject { described_class.new(rgb).for }

      it { is_expected.to eq(dark_color) }
    end
    context 'for blue background' do
      let(:rgb) { RGBUtils::RGB.new(red: 0, green: 0, blue: 255) }

      subject { described_class.new(rgb).for }

      it { is_expected.to eq(light_color) }
    end
    context 'for #7c7cff background' do
      let(:color) { "#7c7cff" }

      subject { described_class.new(color).for }

      it { is_expected.to eq(dark_color) }
    end
  end
end

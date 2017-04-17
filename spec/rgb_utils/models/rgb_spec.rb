require 'spec_helper'

RSpec.describe RGBUtils::RGB do
  describe '#as_unit_range' do
    context 'for white color' do
      let(:rgb) { described_class.new(red: 255, green: 255, blue: 255) }

      subject { rgb.as_unit_range }

      it { is_expected.to eq([1.0, 1.0, 1.0]) }
    end

    context 'for white color using alias' do
      let(:rgb) { described_class.new(r: 255, g: 255, b: 255) }

      subject { rgb.as_unit_range }

      it { is_expected.to eq([1.0, 1.0, 1.0]) }
    end

    context 'for black color' do
      let(:rgb) { described_class.new(red: 0, green: 0, blue: 0) }

      subject { rgb.as_unit_range }

      it { is_expected.to eq([0.0, 0.0, 0.0]) }
    end

    context 'for another color' do
      let(:rgb) { described_class.new(red: 100, green: 200, blue: 174) }

      subject { rgb.as_unit_range }

      it { is_expected.to eq([0.39215686274509803, 0.7843137254901961, 0.6823529411764706]) }
    end
  end

  describe '#to_hex' do
    let(:rgb) { described_class.new(red: 255, green: 255, blue: 255) }

    it 'calls the RGBUtils::RGBToHexConverter convert method' do
      expect(RGBUtils::RGBToHexConverter)
        .to receive(:convert)
        .with(rgb)

      rgb.to_hex
    end
  end
  describe '#contrast_color' do
    let(:rgb) { described_class.new(red: 255, green: 255, blue: 255) }

    context "SimpleContrastColorResolver" do
      it 'calls the SimpleContrastColorResolver' do
        expect(RGBUtils::SimpleContrastColorResolver)
          .to receive(:for)
          .with(rgb)

        rgb.contrast_color(:simple)
      end
    end
    context "ComplexContrastColorResolver" do
      it 'calls the ComplexContrastColorResolver' do
        expect(RGBUtils::ComplexContrastColorResolver)
          .to receive(:for)
          .with(rgb)

        rgb.contrast_color(:complex)
      end
    end
  end
end

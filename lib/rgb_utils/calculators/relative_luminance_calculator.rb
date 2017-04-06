module RGBUtils
  class RelativeLuminanceCalculator < Calculator
    RED_Y = 0.2126
    GREEN_Y = 0.7152
    BLUE_Y = 0.0722

    delegate :red, :green, :blue, to: :linear_rgb

    def initialize(rgb)
      @linear_rgb = RGBToLinearRGBConverter.convert(rgb)
    end

    def calculate
      @luminance ||= (RED_Y * red) + (GREEN_Y * green) + (BLUE_Y * blue)
    end

    private

    attr_reader :linear_rgb
  end
end

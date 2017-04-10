module RGBUtils
  class LumaCalculator < Calculator
    RED_L = 0.299
    GREEN_L = 0.587
    BLUE_L = 0.114

    delegate :red, :green, :blue, to: :rgb

    def initialize(color)
      @rgb = HexToRGBConverter.convert(color)
    end

    def calculate
      @luma ||= ((RED_L * red) + (GREEN_L * green) + (BLUE_L * blue))/255
    end

    private

    attr_reader :rgb
  end
end

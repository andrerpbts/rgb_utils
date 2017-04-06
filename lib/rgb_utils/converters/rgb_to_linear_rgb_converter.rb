module RGBUtils
  class RGBToLinearRGBConverter < Converter
    GAMMA = 2.4
    CUTOFF_POINT = 0.03928
    SLOPE = 12.92

    def initialize(rgb)
      @rgb = HexToRGBConverter.convert(rgb)
    end

    def convert
      @linear_rgb ||= begin
        linear_red, linear_green, linear_blue = calculate_linear_rgb

        LinearRGB.new(red: linear_red, green: linear_green, blue: linear_blue)
      end
    end

    private

    attr_accessor :rgb

    def calculate_linear_rgb
      rgb.as_unit_range.map do |color|
        if color <= CUTOFF_POINT
          color / SLOPE
        else
          ((color + 0.055) / 1.055) ** GAMMA
        end
      end
    end
  end
end

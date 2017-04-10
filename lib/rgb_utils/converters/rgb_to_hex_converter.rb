module RGBUtils
  class RGBToHexConverter < Converter
    def initialize(color)
      @color = color
    end

    def convert
      WebSafeToHexConverter.convert(hex_color)
    end

    private

    attr_reader :color

    def hex_color
      @hex_color ||= begin
        return color unless color.is_a?(RGB)

        [color.red, color.green, color.blue].map do |color_node|
          '%02x' % color_node
        end.join
      end
    end
  end
end

module RGBUtils
  class HexToRGBConverter < Converter
    def initialize(color)
      @color = color
    end

    def convert
      return color if color.is_a?(RGB)

      @rgb ||= begin
        red, green, blue = capture_colors

        RGB.new(red: red, green: green, blue: blue)
      end
    end

    private

    attr_accessor :color

    def capture_colors
      @capture_colors ||= begin
        WebSafeToHexConverter
          .convert(color)
          .match(/(\w{2})(\w{2})(\w{2})/)
          .captures
          .map { |color_node| color_node.to_i(16) }
      end
    end
  end
end

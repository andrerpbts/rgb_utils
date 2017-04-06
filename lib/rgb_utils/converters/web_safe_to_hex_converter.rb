module RGBUtils
  class WebSafeToHexConverter < Converter
    DEFAULT_COLOR = '#000000'.freeze

    def initialize(color)
      @color = color
    end

    def convert
      return DEFAULT_COLOR unless valid?

      result = color_elements
      result.map! { |c| c * 2 } if web_safe?

      "##{result.join}"
    end

    private

    attr_reader :color

    def valid?
      [3, 6].include?(color_elements.count)
    end

    def web_safe?
      color_elements.count == 3
    end

    def color_elements
      @color_elements ||= color.scan(/\h/)
    end
  end
end

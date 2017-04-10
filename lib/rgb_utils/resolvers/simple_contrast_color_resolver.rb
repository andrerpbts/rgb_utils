module RGBUtils
  class SimpleContrastColorResolver < Resolver
    THRESHOLD_VALUE = 186/255.0

    def initialize(color, options = {})
      @color = color
      @light_color = options.fetch(:light_color, Config.light_color)
      @dark_color = options.fetch(:dark_color, Config.dark_color)
    end

    def for
      @result ||= begin
        return dark_color if luma > THRESHOLD_VALUE

        light_color
      end
    end

    private

    attr_reader :color, :light_color, :dark_color

    def luma
      @luma ||= LumaCalculator.calculate(color)
    end
  end
end

module RGBUtils
  class InvertColorResolver < Resolver
    def initialize(color, options = {})
      @color = color
      @light_color = options.fetch(:light_color, Config.light_color)
      @dark_color = options.fetch(:dark_color, Config.dark_color)
    end

    def for
      @result ||= begin
        return dark_color if luminance > luminance_cutoff

        light_color
      end
    end

    private

    attr_reader :color, :light_color, :dark_color

    def luminance
      @luminance ||= RelativeLuminanceCalculator.calculate(color)
    end

    def luminance_cutoff
      Math::sqrt(1.05 * 0.05) - 0.05
    end
  end
end

module RGBUtils
  class RGB
    include Virtus.model

    attribute :red, Color
    attribute :green, Color
    attribute :blue, Color

    def as_unit_range
      [red, green, blue].map { |color| color / 255.0 }
    end

    def to_hex
      RGBToHexConverter.convert(self)
    end

    def contrast_color(type = :simple)
      return SimpleContrastColorResolver.for(self) if type == :simple

      ComplexContrastColorResolver.for(self)
    end
  end
end

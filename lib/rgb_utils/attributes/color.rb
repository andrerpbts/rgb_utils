module RGBUtils
  class Color < Virtus::Attribute
    MIN_VALUE = 0
    MAX_VALUE = 255

    def coerce(value)
      value = value.to_i

      return MIN_VALUE if value < MIN_VALUE
      return MAX_VALUE if value > MAX_VALUE

      value
    end
  end
end

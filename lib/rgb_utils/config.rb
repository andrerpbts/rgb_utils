module RGBUtils
  class Config
    @light_color = '#ffffff'
    @dark_color  = '#000000'

    class << self
      attr_accessor :light_color, :dark_color
    end
  end
end

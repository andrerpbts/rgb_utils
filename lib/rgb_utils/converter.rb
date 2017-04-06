module RGBUtils
  class Converter
    def self.convert(*args)
      new(*args).convert
    end

    def convert
      fail NotImplementedError
    end
  end
end

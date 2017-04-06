module RGBUtils
  class Calculator
    def self.calculate(*args)
      new(*args).calculate
    end

    def calculate
      fail NotImplementedError
    end
  end
end

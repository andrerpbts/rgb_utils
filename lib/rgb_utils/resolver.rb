module RGBUtils
  class Resolver
    def self.for(*args)
      new(*args).for
    end

    def for
      fail NotImplementedError
    end
  end
end

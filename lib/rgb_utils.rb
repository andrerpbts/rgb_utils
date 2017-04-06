require 'virtus'
require 'active_support'
require 'active_support/core_ext'

module RGBUtils
  %w(
    *.rb
    attributes/**/*.rb
    models/**/*.rb
    converters/**/*.rb
    calculators/**/*.rb
    resolvers/**/*.rb
  ).each do |pattern|
    files = File.join(File.dirname(__FILE__), 'rgb_utils', pattern)

    Dir[files].each { |file| require file }
  end
end

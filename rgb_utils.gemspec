# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rgb_utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'rgb_utils'
  spec.version       = RGBUtils::VERSION
  spec.authors       = ['andrerpbts', 'brunohkbx']
  spec.email         = ['andrerpbts@gmail.com', 'bruno.f.castro12@hotmail.com ']

  spec.summary       = %q{A set of RGB functions}
  spec.description   = %q{A set of RGB functions like luminance, converters and constrast resolvers}
  spec.homepage      = 'https://github.com/andrerpbts/rgb_utils'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'activesupport', '>= 3.2'
  spec.add_dependency 'virtus', '~> 1.0'
end

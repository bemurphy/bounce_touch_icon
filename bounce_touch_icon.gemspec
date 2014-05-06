# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bounce_touch_icon/version'

Gem::Specification.new do |spec|
  spec.name          = "bounce_touch_icon"
  spec.version       = BounceTouchIcon::VERSION
  spec.authors       = ["Brendon Murphy"]
  spec.email         = ["xternal1+github@gmail.com"]
  spec.description   = %q{Rack middleware to 404 touch icon requests from iOS devices}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test", "~> 0.6.2"
end

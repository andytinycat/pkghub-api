# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pkghub/api/version'

Gem::Specification.new do |spec|
  spec.name          = "pkghub-api"
  spec.version       = Pkghub::API::VERSION
  spec.authors       = ["Andy Sykes"]
  spec.email         = ["github@tinycat.co.uk"]
  spec.description   = %q{Gem for accessing the pkghub.io API}
  spec.summary       = %q{Gem for accessing the pkghub.io API, uploading packages and making changes}
  spec.homepage      = "https://pkghub.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "multipart-post"
  spec.add_dependency "commander"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mime_type_list/version'

Gem::Specification.new do |spec|
  spec.name          = "mime_type_list"
  spec.version       = MimeTypeList::VERSION
  spec.authors       = ["Thinkific"]
  spec.email         = ["support@thinkific.com"]
  spec.description   = %q{Gets mime types for specific media types}
  spec.summary       = %q{Gets mime types for specific media types}
  spec.homepage      = "http://thinkific.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

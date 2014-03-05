# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_sqlite/version'

Gem::Specification.new do |spec|
  spec.name          = "fast_sqlite"
  spec.version       = FastSqlite::VERSION
  spec.authors       = ["John Hawthorn"]
  spec.email         = ["john.hawthorn@gmail.com"]
  spec.summary       = %q{Makes sqlite faster, and probably deletes your data}
  spec.description   = %q{Sets all sqlite connections to be as performant as possible while sacrificing of data integrity.}
  spec.homepage      = "https://github.com/jhawthorn/fast_sqlite"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sqlite3"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

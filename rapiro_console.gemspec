# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rapiro_console/version'

Gem::Specification.new do |spec|
  spec.name          = 'rapiro_console'
  spec.version       = RapiroConsole::VERSION
  spec.authors       = ['Takahiro HAMAGUCHI']
  spec.email         = ['tk.hamaguchi@gmail.com']
  spec.summary       = %q{A gem providing access to RAPIRO with console}
  spec.description   = %q{A gem providing access to RAPIRO with console.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'rapiro_wrapper', '~> 0.1'
  spec.add_dependency 'i2c_led_matrix_8x8', '0.0.2'
end

# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "transfigure/version"

Gem::Specification.new do |spec|
  spec.name = "transfigure"
  spec.version = Transfigure::VERSION
  spec.authors = ["Cameron C. Dutro"]

  spec.summary = "An experimental Ruby native extension that allows changing an object's class at runtime."
  spec.homepage = "https://github.com/camertron/transfigure"
  spec.license = "MIT"

  spec.files = Dir["LICENSE.txt", "README.md", "{ext,lib,spec}/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"
  spec.extensions = %w[ext/transfigure/extconf.rb]
end

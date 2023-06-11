# frozen_string_literal: true

require "bundler"
require "rake/extensiontask"
require 'rspec/core/rake_task'

spec = Bundler.load_gemspec("transfigure.gemspec")

Rake::ExtensionTask.new("transfigure", spec) do |ext|
  ext.ext_dir = "ext/transfigure"
  ext.lib_dir = "lib/transfigure"
end

Bundler::GemHelper.install_tasks

task :bench do
  load File.join(*%w(script bench.rb))
end

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end

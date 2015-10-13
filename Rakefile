#!/usr/bin/env rake
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList['test/**/*_spec.rb']
  t.verbose = true
end

desc 'Runs foodcritic linter'
task :foodcritic do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sh 'foodcritic . '
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc 'Runs Rubocop linter'
task :rubocop do
  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sh 'rubocop . '
  else
    puts "WARN: Rubocop run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

task default: %w(test foodcritic rubocop)

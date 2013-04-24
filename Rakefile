require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'semver'

RSpec::Core::RakeTask.new(:spec)

task :default => %w{spec}

task :ci => %w{ci_version spec build}

task :ci_version do
  v = SemVer.find
  v.special = "#{ENV['BUILD_NUMBER'] || 0}-pre"
  v.save
end

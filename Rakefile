require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'semver'

RSpec::Core::RakeTask.new(:spec)

task :default => %w{spec}

task :ci => %w{clean ci_version spec build version_undo_file_changes}

task :clean do
  `git clean -dfx`
end

task :ci_version do
  v = SemVer.find
  v.patch = ENV['BUILD_NUMBER'] || 0
  v.special = "pre"
  v.save
end

task :version_undo_file_changes do
  `git checkout .semver`
end

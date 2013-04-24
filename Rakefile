require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'semver'

RSpec::Core::RakeTask.new(:spec)

desc 'Default task runs tests, sets dev version, and builds the gem'
task :default => %w{dev_version spec build version_undo_file_changes}

desc 'Teamcity build process'
task :ci => %w{clean ci_version spec build version_undo_file_changes}

task :clean do
  `git clean -dfx`
end

task :dev_version do
  set_patch_version(0, 'dev')
end

task :ci_version do
  patch = ENV['BUILD_NUMBER'] || 0
  set_patch_version(patch, 'pre')
end

task :version_undo_file_changes do
  `git checkout .semver`
end

def set_patch_version(patch, special)
  v = SemVer.find
  v.patch = patch
  v.special = special
  v.save
end

require 'semver'

module Ripple
  module Rake
    v = SemVer.find
    VERSION = v.format('%M.%m.%p%s').gsub(/-/, '.')
  end
end

require 'ripple-cli/rake/engine'
require 'ripple-cli/rake/param_builders/feeds'
require 'ripple-cli/rake/param_builders/force'

module Ripple
  module Rake
    class Restore
      include Engine
      include ParamBuilders::Feeds
      include ParamBuilders::Force

      def command
        'restore'
      end
    end
  end
end

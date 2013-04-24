require 'ripple-cli/rake/engine'
require 'ripple-cli/rake/param_builders/feeds'
require 'ripple-cli/rake/param_builders/force'
require 'ripple-cli/rake/param_builders/solution'

module Ripple
  module Rake
    class Restore
      include Engine
      include ParamBuilders::Feeds
      include ParamBuilders::Cache
      include ParamBuilders::Solution
      include ParamBuilders::Force
      include ParamBuilders::Verbose

      def command
        'restore'
      end
    end
  end
end

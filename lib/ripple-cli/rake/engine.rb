module Ripple
  module Rake
    module Engine
      def execute
        system("ripple #{command} #{build_args}")
      end
    end
  end
end

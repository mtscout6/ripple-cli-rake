module Ripple
  module Rake
    module ParamBuilders
      module Verbose
        attr_accessor :verbose

        def build_args
          args = ''
          args = super if defined?(super)
          args = "#{args} --verbose" if @verbose
          args.strip
        end
      end
    end
  end
end

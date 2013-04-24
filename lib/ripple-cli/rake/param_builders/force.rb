module Ripple
  module Rake
    module ParamBuilders
      module Force
        attr_accessor :force

        def build_args
          args = ''
          args = super if defined?(super)
          args = "#{args} --force" if @force
          args.strip
        end
      end
    end
  end
end

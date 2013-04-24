module Ripple
  module Rake
    module ParamBuilders
      module Cache
        attr_accessor :cache

        def build_args
          args = ''
          args = super if defined?(super)
          args = "#{args} --cache \"#{@cache}\"" unless @cache.nil? or @cache.empty?
          args.strip
        end
      end
    end
  end
end

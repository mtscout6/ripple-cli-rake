module Ripple
  module Rake
    module ParamBuilders
      module Feeds
        attr_accessor :feeds

        def build_args
          args = ''
          args = super if defined?(super)
          args = "#{args} --feeds \"#{@feeds.join('#')}\"" unless @feeds.nil? or @feeds.length < 1
          args.strip
        end
      end
    end
  end
end

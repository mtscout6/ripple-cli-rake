module Ripple
  module Rake
    module ParamBuilders
      module Solution
        attr_accessor :solution, :all_solutions

        def build_args
          args = ''
          args = super if defined?(super)

          if @all_solutions
            args = "#{args} --all"
          else
            args = "#{args} --solution \"#{@solution}\"" unless @solution.nil? or @solution.empty?
          end

          args.strip
        end
      end
    end
  end
end

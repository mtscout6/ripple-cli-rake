require 'ripple-cli/rake/param_builders/verbose'

module Ripple
  module Rake
    module ParamBuilders
      module VerboseTestSuper
        def build_args
          'super args'
        end
      end

      module Verbose
        class TestNoSuper
          include Verbose
        end

        class TestWithSuper
          include VerboseTestSuper
          include Verbose
        end

        describe TestNoSuper do
          describe '#build_args' do
            context 'with nil verbose' do
              it { subject.build_args.should eq '' }
            end

            context 'with no verbose' do
              before { subject.verbose = false }
              it { subject.build_args.should eq '' }
            end

            context 'with yes verbose' do
              before { subject.verbose = true }
              it { subject.build_args.should eq '--verbose' }
            end
          end
        end

        describe TestWithSuper do
          describe '#build_args' do
            context 'with nil verbose' do
              it { subject.build_args.should eq 'super args' }
            end

            context 'with no verbose' do
              before { subject.verbose = false }
              it { subject.build_args.should eq 'super args' }
            end

            context 'with yes verbose' do
              before { subject.verbose = true }
              it { subject.build_args.should eq 'super args --verbose' }
            end
          end
        end
      end
    end
  end
end

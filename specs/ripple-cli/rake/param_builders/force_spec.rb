require 'ripple-cli/rake/param_builders/force'

module Ripple
  module Rake
    module ParamBuilders
      module ForceTestSuper
        def build_args
          'super args'
        end
      end

      module Force
        class TestNoSuper
          include Force
        end

        class TestWithSuper
          include ForceTestSuper
          include Force
        end

        describe TestNoSuper do
          describe '#build_args' do
            context 'with nil force' do
              it { subject.build_args.should eq '' }
            end

            context 'with no force' do
              before { subject.force = false }
              it { subject.build_args.should eq '' }
            end

            context 'with yes force' do
              before { subject.force = true }
              it { subject.build_args.should eq '--force' }
            end
          end
        end

        describe TestWithSuper do
          describe '#build_args' do
            context 'with nil force' do
              it { subject.build_args.should eq 'super args' }
            end

            context 'with no force' do
              before { subject.force = false }
              it { subject.build_args.should eq 'super args' }
            end

            context 'with yes force' do
              before { subject.force = true }
              it { subject.build_args.should eq 'super args --force' }
            end
          end
        end
      end
    end
  end
end

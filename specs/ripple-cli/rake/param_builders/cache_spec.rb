require 'ripple-cli/rake/param_builders/cache'

module Ripple
  module Rake
    module ParamBuilders
      module CacheTestSuper
        def build_args
          'super args'
        end
      end

      module Cache
        class TestNoSuper
          include Cache
        end

        class TestWithSuper
          include CacheTestSuper
          include Cache
        end

        describe TestNoSuper do
          describe '#build_args' do
            context 'with nil cache' do
              it { subject.build_args.should eq '' }
            end

            context 'with no cache' do
              before { subject.cache = [] }
              it { subject.build_args.should eq '' }
            end

            context 'with one feed' do
              before { subject.cache = 'some/cache' }
              it { subject.build_args.should eq '--cache "some/cache"' }
            end
          end
        end

        describe TestWithSuper do
          describe '#build_args' do
            context 'with nil cache' do
              it { subject.build_args.should eq 'super args' }
            end

            context 'with no cache' do
              before { subject.cache = [] }
              it { subject.build_args.should eq 'super args' }
            end

            context 'with one feed' do
              before { subject.cache = 'some/cache' }
              it { subject.build_args.should eq 'super args --cache "some/cache"' }
            end
          end
        end
      end
    end
  end
end

require 'ripple-cli/rake/param_builders/feeds'

module Ripple
  module Rake
    module ParamBuilders
      module FeedsTestSuper
        def build_args
          'super args'
        end
      end

      module Feeds
        class TestNoSuper
          include Feeds
        end

        class TestWithSuper
          include FeedsTestSuper
          include Feeds
        end

        describe TestNoSuper do
          describe '#build_args' do
            context 'with nil feeds' do
              it { subject.build_args.should eq '' }
            end

            context 'with no feeds' do
              before { subject.feeds = [] }
              it { subject.build_args.should eq '' }
            end

            context 'with one feed' do
              before { subject.feeds = ['feed1'] }
              it { subject.build_args.should eq '--feeds "feed1"' }
            end
          end
        end

        describe TestWithSuper do
          describe '#build_args' do
            context 'with nil feeds' do
              it { subject.build_args.should eq 'super args' }
            end

            context 'with no feeds' do
              before { subject.feeds = [] }
              it { subject.build_args.should eq 'super args' }
            end

            context 'with one feed' do
              before { subject.feeds = ['feed1'] }
              it { subject.build_args.should eq "super args --feeds \"feed1\"" }
            end
          end
        end
      end
    end
  end
end

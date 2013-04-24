require 'ripple-cli/rake/restore'

module Ripple
  module Rake
    describe Restore do
      subject { Restore.new }

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
  end
end

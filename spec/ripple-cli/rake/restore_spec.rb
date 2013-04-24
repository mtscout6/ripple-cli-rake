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

        context 'with all_solutions nil' do
          context 'with nil solution' do
            it { subject.build_args.should eq '' }
          end

          context 'with no solution' do
            before { subject.solution = '' }
            it { subject.build_args.should eq '' }
          end

          context 'with one feed' do
            before { subject.solution = 'solutionfile' }
            it { subject.build_args.should eq '--solution "solutionfile"' }
          end
        end

        context 'with all_solutions false' do
          before { subject.all_solutions = false }

          context 'with nil solution' do
            it { subject.build_args.should eq '' }
          end

          context 'with no solution' do
            before { subject.solution = '' }
            it { subject.build_args.should eq '' }
          end

          context 'with one feed' do
            before { subject.solution = 'solutionfile' }
            it { subject.build_args.should eq '--solution "solutionfile"' }
          end
        end

        context 'with all_solutions true' do
          before { subject.all_solutions = true }

          context 'with nil solution' do
            it { subject.build_args.should eq '--all' }
          end

          context 'with no solution' do
            before { subject.solution = '' }
            it { subject.build_args.should eq '--all' }
          end

          context 'with one feed' do
            before { subject.solution = 'solutionfile' }
            it { subject.build_args.should eq '--all' }
          end
        end

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

        context 'with feeds, cache, all_solutions, force, and verbose' do
          before {
            subject.feeds = ['feed1', 'feed2']
            subject.cache = 'some/cache'
            subject.all_solutions = true
            subject.force = true
            subject.verbose = true
          }
          it { subject.build_args.should eq '--feeds "feed1#feed2" --cache "some/cache" --all --force --verbose' }
        end
      end
    end
  end
end

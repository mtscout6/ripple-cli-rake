require 'ripple-cli/rake/param_builders/solution'

module Ripple
  module Rake
    module ParamBuilders
      module SolutionTestSuper
        def build_args
          'super args'
        end
      end

      module Solution
        class TestNoSuper
          include Solution
        end

        class TestWithSuper
          include SolutionTestSuper
          include Solution
        end

        describe TestNoSuper do
          describe '#build_args' do
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
          end
        end

        describe TestWithSuper do
          describe '#build_args' do
            context 'with all_solutions nil' do
              context 'with nil solution' do
                it { subject.build_args.should eq 'super args' }
              end

              context 'with no solution' do
                before { subject.solution = '' }
                it { subject.build_args.should eq 'super args' }
              end

              context 'with one feed' do
                before { subject.solution = 'solutionfile' }
                it { subject.build_args.should eq 'super args --solution "solutionfile"' }
              end
            end

            context 'with all_solutions false' do
              before { subject.all_solutions = false }

              context 'with nil solution' do
                it { subject.build_args.should eq 'super args' }
              end

              context 'with no solution' do
                before { subject.solution = '' }
                it { subject.build_args.should eq 'super args' }
              end

              context 'with one feed' do
                before { subject.solution = 'solutionfile' }
                it { subject.build_args.should eq 'super args --solution "solutionfile"' }
              end
            end

            context 'with all_solutions true' do
              before { subject.all_solutions = true }

              context 'with nil solution' do
                it { subject.build_args.should eq 'super args --all' }
              end

              context 'with no solution' do
                before { subject.solution = '' }
                it { subject.build_args.should eq 'super args --all' }
              end

              context 'with one feed' do
                before { subject.solution = 'solutionfile' }
                it { subject.build_args.should eq 'super args --all' }
              end
            end
          end
        end
      end
    end
  end
end

classdef test_agent_performance < matlab.unittest.TestCase
    methods (TestClassSetup)
        function addHarnessToPath(testCase)
            % This forces MATLAB to see the 'harness' folder as a package root
            import matlab.unittest.fixtures.PathFixture;
            harnessPath = fullfile(pwd, 'harness');
            testCase.applyFixture(PathFixture(harnessPath));
        end
    end

    methods (Test)
        function testDivergenceLogging(testCase)
            % Verify we can now see the classes
            env = core.Environment();
            logger = utils.CognitiveLogger();
            
            predictedState = [0.5, 0.5, 0.5, 0.5, 0.5];
            actualState = env.getObservation();
            
            logger.logDivergence(1, predictedState, actualState, 'Baseline Test');
            
            testCase.verifyNotEmpty(logger.Trace, 'Trace should not be empty');
            testCase.verifyTrue(isnumeric(logger.Trace(end).Divergence), 'Divergence must be numeric');
            
            fprintf('Tested Divergence: %.4f\n', logger.Trace(end).Divergence);
        end
    end
end

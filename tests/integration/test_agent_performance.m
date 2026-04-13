classdef test_agent_performance < matlab.unittest.TestCase
    methods (TestClassSetup)
        function addHarnessToPath(testCase)
            import matlab.unittest.fixtures.PathFixture;
            % Dynamically find project root (2 levels up from this file)
            thisPath = fileparts(mfilename('fullpath'));
            projectRoot = fileparts(fileparts(thisPath)); 
            harnessPath = fullfile(projectRoot, 'harness');
            
            % Add the harness root to path so +core and +utils resolve
            testCase.applyFixture(PathFixture(harnessPath));
        end
    end

    methods (Test)
        function testDivergenceLogging(testCase)
            % Instantiate using package namespaces
            env = core.Environment();
            logger = utils.CognitiveLogger();
            
            % Simulated baseline data
            predictedState = [0.5, 0.5, 0.5, 0.5, 0.5];
            actualState = env.getObservation();
            
            % Log the 'Reasoning Error'
            logger.logDivergence(1, predictedState, actualState, 'Infrastructure Baseline');
            
            % Assertions
            testCase.verifyNotEmpty(logger.Trace, 'Cognitive trace was not recorded.');
            testCase.verifyTrue(isnumeric(logger.Trace(end).Divergence));
            
            fprintf('--- Breakthrough Metric Captured ---\n');
            fprintf('Current Divergence Index: %.4f\n', logger.Trace(end).Divergence);
        end
    end
end

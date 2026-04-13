classdef test_agent_performance < matlab.unittest.TestCase
    methods (Test)
        function testDivergenceLogging(testCase)
            % Use explicit package names
            env = core.Environment();
            logger = utils.CognitiveLogger();
            
            pred = [0.5, 0.5, 0.5, 0.5, 0.5];
            obs = env.getObservation();
            
            logger.logDivergence(1, pred, obs, 'CI Baseline');
            
            testCase.verifyNotEmpty(logger.Trace);
            fprintf('Divergence Verified: %.4f\n', logger.Trace(end).Divergence);
        end
    end
end

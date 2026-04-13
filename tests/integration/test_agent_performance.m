function tests = test_agent_performance_suite
    tests = functiontests(localfunctions);
end

function testDivergenceLogging(testCase)
    env = core.Environment();
    logger = utils.CognitiveLogger();
    predictedState = [0.5, 0.5, 0.5, 0.5, 0.5];
    actualState = env.getObservation();
    logger.logDivergence(1, predictedState, actualState, 'Baseline Test');
    testCase.verifyNotEmpty(logger.Trace, 'Trace should not be empty');
    testCase.verifyTrue(isnumeric(logger.Trace(end).Divergence), 'Divergence must be numeric');
    fprintf('Tested Divergence: %.4f\n', logger.Trace(end).Divergence);
end

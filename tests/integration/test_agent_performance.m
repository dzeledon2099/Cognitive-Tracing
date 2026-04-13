function tests = test_agent_performance
    tests = functiontests(localfunctions);
end

function testDivergenceLogging(testCase)
    % Initialize the environment and logger
    % Note: Using package syntax to ensure pathing works in CI
    env = core.Environment();
    logger = utils.CognitiveLogger();
    
    % Simulate a "thought" vs "reality" step
    predictedState = [0.5, 0.5, 0.5, 0.5, 0.5];
    actualState = env.getObservation();
    
    % Log the divergence
    logger.logDivergence(1, predictedState, actualState, 'Baseline Test');
    
    % Verify the trace was recorded
    testCase.verifyNotEmpty(logger.Trace, 'Trace should not be empty');
    testCase.verifyTrue(isnumeric(logger.Trace(end).Divergence), 'Divergence must be numeric');
    
    fprintf('Tested Divergence: %.4f\n', logger.Trace(end).Divergence);
end
git add tests/integration/test_agent_performance.m
git commit -m "Populate integration test file"
git push
ls tests/integration

cat <<EOF > tests/integration/test_agent_performance.m
function tests = test_agent_performance
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

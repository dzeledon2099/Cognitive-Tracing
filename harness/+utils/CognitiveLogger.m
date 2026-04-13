classdef CognitiveLogger < handle
    properties
        Trace = struct('Step', {}, 'Divergence', {}, 'Reasoning', {})
    end
    methods
        function logDivergence(obj, step, pred, actual, reasoning)
            err = norm(pred - actual);
            entry = struct('Step', step, 'Divergence', err, 'Reasoning', reasoning);
            obj.Trace(end+1) = entry;
            % Pre-create logs dir if it doesn't exist
            if ~exist('logs', 'dir'), mkdir('logs'); end
            save('logs/last_trace.mat', 'entry');
        end
    end
end

classdef CognitiveLogger < handle
    properties
        Trace = struct('Step', {}, 'Divergence', {}, 'Reasoning', {})
    end
    methods
        function logDivergence(obj, step, pred, actual, reasoning)
            err = norm(pred - actual);
            entry = struct('Step', step, 'Divergence', err, 'Reasoning', reasoning);
            obj.Trace(end+1) = entry;
            
            % Pro Fix: Ensure the directory exists before saving
            logDir = 'logs';
            if ~exist(logDir, 'dir')
                mkdir(logDir);
            end
            
            save(fullfile(logDir, 'last_trace.mat'), 'entry');
        end
    end
end

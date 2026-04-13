classdef CognitiveLogger < handle
    properties
        Trace = struct('Step', {}, 'Divergence', {}, 'Reasoning', {})
    end
    methods
        function logDivergence(obj, step, pred, actual, reasoning)
            err = norm(pred - actual);
            entry = struct('Step', step, 'Divergence', err, 'Reasoning', reasoning);
            obj.Trace(end+1) = entry;
            
            % Get project root (where the 'logs' folder should be)
            % This goes up two levels from the +utils folder
            thisPath = fileparts(mfilename('fullpath'));
            projectRoot = fileparts(fileparts(thisPath));
            logDir = fullfile(projectRoot, 'logs');
            
            % Force create the directory if it's missing
            if ~exist(logDir, 'dir')
                mkdir(logDir);
            end
            
            save(fullfile(logDir, 'last_trace.mat'), 'entry');
        end
    end
end
